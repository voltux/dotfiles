## Configuration files

These configuration files clearly reflect my personal taste. I try to maintain them in order to be easily reusable but they remain adapted to my personal needs.

### Prerequisites

#### Required
* Zsh    -> configuration framework: https://github.com/robbyrussell/oh-my-zsh
* Tmux   -> plugins installed via tpm: https://github.com/tmux-plugins/tpm
* Vim    -> plugins loaded with vim-plug: https://github.com/junegunn/vim-plug
* Neovim -> plugins loaded with Packer: https://github.com/wbthomason/packer.nvim

#### Optional
* stow (easy install dotfiles)                       -> distro package
* fzf (zsh, vim fuzzy find)                          -> distro package or https://github.com/junegunn/fzf
* zsh-z plugin (zsh easily move between directories) -> https://github.com/agkozak/zsh-z
* starship (shell prompt)                            -> https://starship.rs/
* ripgrep (grep replacement)                         -> https://github.com/BurntSushi/ripgrep
* bat (cat replacement)                              -> https://github.com/sharkdp/bat
* lazygit (git tui tool)                             -> https://github.com/jesseduffield/lazygit

### Installation

Clone the repository

#### Via stow (recommended)

From the cloned repo and having stow installed you can simply:

`stow -t $HOME <app>`

Example of installing vim and tmux configs for user voltux:

`stow -t /home/voltux vim tmux`

#### Manually

Copy (if you are happy with the current version) or symlink (if you want to stay up to date with the repo) everything contained in the root of every package config to the desired user's $HOME directory.
