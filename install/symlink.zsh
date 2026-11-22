#!/usr/bin/env zsh

backup_dir="${HOME}/.dotfiles-backup/$(date +%Y%m%d%H%M%S)"

# ln -nfs links inside an existing real directory instead of replacing it,
# and silently overwrites an existing real file, so move either aside first.
function link_config() {
    local src="$1" dest="$2"
    if [[ -e "${dest}" && ! -L "${dest}" ]]; then
        local backup="${backup_dir}/${dest#"${HOME}"/}"
        mkdir -p "${backup:h}"
        mv "${dest}" "${backup}"
        echo "Moved existing ${dest} to ${backup}"
    fi
    ln -nfs "${src}" "${dest}"
}

# config
if [ ! -d "${HOME}/.config" ]; then
    mkdir "${HOME}/.config"
fi
link_config "${HOME}/dotfiles/.config/git" "${HOME}/.config/git"
link_config "${HOME}/dotfiles/.config/git/.gitconfig" "${HOME}/.gitconfig"
link_config "${HOME}/dotfiles/.config/gh" "${HOME}/.config/gh"

# zed (file-level symlink so Zed runtime artifacts under ~/.config/zed
# — prompts LMDB, future caches — don't leak into the dotfiles repo)
if [ ! -d "${HOME}/.config/zed" ]; then
    mkdir -p "${HOME}/.config/zed"
fi
link_config "${HOME}/dotfiles/.config/zed/settings.json" "${HOME}/.config/zed/settings.json"

# herdr (file-level symlink so herdr runtime artifacts under ~/.config/herdr
# — sockets, logs, session state, plugin lock — don't leak into the repo)
if [ ! -d "${HOME}/.config/herdr" ]; then
    mkdir -p "${HOME}/.config/herdr"
fi
link_config "${HOME}/dotfiles/.config/herdr/config.toml" "${HOME}/.config/herdr/config.toml"
# Generate herdr notification sounds from macOS system sounds. Generated
# locally and never committed: Apple's sound files are not redistributable.
if [[ "$(uname)" == "Darwin" ]] && command -v ffmpeg >/dev/null; then
    mkdir -p "${HOME}/.config/herdr/sounds"
    ffmpeg -i /System/Library/Sounds/Glass.aiff -codec:a libmp3lame -qscale:a 4 \
        "${HOME}/.config/herdr/sounds/request.mp3" -loglevel error -y
    ffmpeg -i /System/Library/Sounds/Blow.aiff -codec:a libmp3lame -qscale:a 4 \
        "${HOME}/.config/herdr/sounds/done.mp3" -loglevel error -y
fi

# herdr desktop app (file-level symlinks: ~/.config/herdr-app also holds
# runtime state and Herdr-owned files that the app rewrites on every start)
mkdir -p "${HOME}/.config/herdr-app/mods" "${HOME}/.config/herdr-app/layouts"
link_config "${HOME}/dotfiles/.config/herdr-app/settings.json" "${HOME}/.config/herdr-app/settings.json"
link_config "${HOME}/dotfiles/.config/herdr-app/keys.json" "${HOME}/.config/herdr-app/keys.json"
for mod in "${HOME}"/dotfiles/.config/herdr-app/mods/*(N/); do
    link_config "${mod}" "${HOME}/.config/herdr-app/mods/${mod:t}"
done
for layout in "${HOME}"/dotfiles/.config/herdr-app/layouts/*.json(N); do
    link_config "${layout}" "${HOME}/.config/herdr-app/layouts/${layout:t}"
done

# Claude Code configuration (~/.claude) is managed in a separate repository.

# zshrc
link_config "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"
