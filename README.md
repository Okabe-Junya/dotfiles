# dotfiles

![license](https://img.shields.io/github/license/Okabe-Junya/dotfiles)
[![Dependency Review](https://github.com/Okabe-Junya/dotfiles/actions/workflows/dependency-review.yml/badge.svg)](https://github.com/Okabe-Junya/dotfiles/actions/workflows/dependency-review.yml) [![Differential ShellCheck](https://github.com/Okabe-Junya/dotfiles/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/Okabe-Junya/dotfiles/actions/workflows/shellcheck.yml) [![reviewdog](https://github.com/Okabe-Junya/dotfiles/actions/workflows/reviewdog.yml/badge.svg)](https://github.com/Okabe-Junya/dotfiles/actions/workflows/reviewdog.yml) [![Test](https://github.com/Okabe-Junya/dotfiles/actions/workflows/test.yml/badge.svg)](https://github.com/Okabe-Junya/dotfiles/actions/workflows/test.yml)

## abstract

My dotfiles (e.g. `.zshrc`, `.vimrc`, etc.) for macOS.

## usage

First, Clone this repository

```txt
% git clone https://github.com/Okabe-Junya/dotfiles.git
```

or (if you don't need git history)

```txt
% git clone --depth 1 https://github.com/Okabe-Junya/dotfiles.git
```

Run `make`. You only need to run this command once. If you build all dotfiles, you can run `make build` command.

```txt
% cd dotfiles
% make  # or make build
```

After a while... it's done! You don't need some software to install manually. Only you need to do is to run `make build` command.

## features

- [ ] [bash](https://www.gnu.org/software/bash/)
- [x] [zsh](https://www.zsh.org/)
- [x] [code](https://code.visualstudio.com/)
- [ ] [vim](https://www.vim.org/)
- [x] [neovim](https://neovim.io/)
- [x] [pyenv](https://github.com/pyenv/pyenv)
- [x] [latex](https://www.latex-project.org/)

## brew bundle

If you want to check what software is installed by `brew bundle`, you can check [Brewfile](Brewfile).

## license

Licensed under the [MIT License](LICENSE)
