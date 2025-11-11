# dotfiles

![License](https://img.shields.io/github/license/Okabe-Junya/dotfiles) [![Lint](https://github.com/Okabe-Junya/dotfiles/actions/workflows/lint.yml/badge.svg)](https://github.com/Okabe-Junya/dotfiles/actions/workflows/lint.yml) [![E2E Test](https://github.com/Okabe-Junya/dotfiles/actions/workflows/e2e.yml/badge.svg)](https://github.com/Okabe-Junya/dotfiles/actions/workflows/e2e.yml)

macOS (Apple Silicon) development environment configuration files.

## Requirements

- macOS (Apple Silicon / ARM64)
- Internet connection
- Administrator privileges (for sudo commands)

## Installation

### One-line Installation (Non-interactive)

This will install everything without prompting:

```sh
curl -L https://raw.githubusercontent.com/Okabe-Junya/dotfiles/main/install.zsh | zsh -s -- --non-interactive
```

### Interactive Installation

This will prompt you before installing Homebrew packages:

```sh
curl -L https://raw.githubusercontent.com/Okabe-Junya/dotfiles/main/install.zsh | zsh
```

### Manual Installation

If you prefer to install step by step:

```sh
# Clone the repository
git clone https://github.com/Okabe-Junya/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run the installation script
zsh install.zsh
```

## What Gets Installed

The installation script will:

1. Check system requirements (macOS on Apple Silicon)
2. Clone this repository to `~/dotfiles`
3. Install Xcode Command Line Tools (if not already installed)
4. Install Homebrew (if not already installed)
5. Install Oh My Zsh (if not already installed)
6. Install packages from Brewfile (optional in interactive mode)
7. Create symbolic links for configuration files

## Installed Packages

The Brewfile includes:

- **Core utilities**: coreutils, curl, direnv, tmux, tree
- **Modern Unix tools**: bat, fzf, ripgrep, jq, lsd
- **Development tools**: gcc, cmake, llvm
- **Programming languages**: Go, Rust, Node.js (nodenv), Python (pyenv), Ruby (rbenv)
- **Kubernetes tools**: kubectl, helm, k9s, kind, minikube
- **Cloud tools**: AWS CLI, Google Cloud SDK
- **Fonts**: Hack Nerd Font
- **Applications**: Google Chrome, Visual Studio Code

See [install/Brewfile](install/Brewfile) for the complete list.

## Configuration Files

The following files will be symlinked:

- `.zshrc` → `~/dotfiles/.zshrc`
- `.config/git` → `~/dotfiles/.config/git`
- `.gitconfig` → `~/dotfiles/.config/git/.gitconfig`
- `.config/gh` → `~/dotfiles/.config/gh`

Existing `.zshrc` will be backed up as `.zshrc.bak`.

## Troubleshooting

### Homebrew not found after installation

If `brew` command is not found after installation, add the following to your shell:

```sh
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Then restart your terminal or run `source ~/.zshrc`.

### Sudo password required

The installation script requires sudo access for:
- Installing Xcode Command Line Tools
- Installing Homebrew

Make sure you can run sudo commands before starting the installation.

### Installation fails during brew bundle

If the Homebrew package installation fails, you can:

1. Check your internet connection
2. Update Homebrew: `brew update`
3. Run the bundle installation manually:
   ```sh
   cd ~/dotfiles
   brew bundle install --file=./install/Brewfile
   ```

### Oh My Zsh installation changes shell

Oh My Zsh might attempt to change your default shell. The installation script uses the `--unattended` flag to prevent interactive prompts.

## Development

### CI/CD Workflows

This repository uses GitHub Actions for continuous integration:

#### Lint Workflow (Fast)
- **Runs on**: All PRs and pushes to main
- **Runner**: Ubuntu (fast and cheap)
- **Duration**: ~1-2 minutes
- **Checks**:
  - File existence validation
  - Brewfile syntax validation
  - Common issues detection (hardcoded paths, etc.)
  - Zsh syntax check (macOS runner)

#### ShellCheck Workflow
- **Runs on**: All PRs
- **Runner**: Ubuntu
- **Uses**: [reviewdog/action-shellcheck](https://github.com/reviewdog/action-shellcheck) for PR review comments

#### E2E Test Workflow (Comprehensive)
- **Runs on**:
  - All pushes to main
  - Scheduled (1st day of each month at 00:00 UTC)
  - Manual trigger (workflow_dispatch)
  - Quick smoke test on PRs (without full brew bundle)
- **Runner**: macOS (required for actual installation)
- **Duration**: ~30-60 minutes for full installation
- **Tests**:
  - **Smoke test (PR only)**: Basic function tests and symlink verification (~5 min)
  - **Full installation**: Complete setup with all packages
  - **README installation**: Tests the one-line curl command

This separation ensures fast feedback on PRs while maintaining comprehensive testing on the main branch.

## Uninstallation

To remove the symbolic links:

```sh
rm ~/.zshrc
rm ~/.gitconfig
rm -rf ~/.config/git
rm -rf ~/.config/gh

# Restore backup if it exists
if [ -f ~/.zshrc.bak ]; then
    mv ~/.zshrc.bak ~/.zshrc
fi
```

To completely remove installed components:

```sh
# Remove Oh My Zsh
rm -rf ~/.oh-my-zsh

# Remove Homebrew (be careful!)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# Remove dotfiles
rm -rf ~/dotfiles
```

## License

This repository is licensed under the MIT license. See [LICENSE](LICENSE) for details.
