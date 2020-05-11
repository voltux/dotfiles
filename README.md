## Configuration files intended to be installed with stow

### Prerequisites

#### Required
* Zsh        -> configuration framework: https://github.com/robbyrussell/oh-my-zsh
* Tmux       -> plugins installed via tpm: https://github.com/tmux-plugins/tpm
* Vim/Neovim -> plugins loaded with vim-plug: https://github.com/junegunn/vim-plug

#### Optional
* stow (easy install) -> distro package
* fzf (zsh, vim)      -> distro package or https://github.com/junegunn/fzf
* zsh-z plugin (zsh)  -> https://github.com/agkozak/zsh-z

### Installation

#### Via stow (recommended)

`stow -t $TARGET_USER_HOME [confs]`

Example of installing vim and tmux configs for user voltux:

`stow -t /home/voltux vim tmux`

#### Manually

Copy or symlink everything contained in the root of every package config to the desired user's $HOME directory.
