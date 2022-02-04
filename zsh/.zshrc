# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

# oh-my-zsh variable configuration
ZSH_THEME="voltus"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=(tmux common-aliases git vi-mode archlinux docker colored-man-pages zsh-z)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# some custom aliases to override potential changes
alias l='ls -lh'
alias ll='ls -lh'
alias la='ls -lha'
alias sl=ls
alias vimrc='vim ~/.vimrc'
alias vi='vim -u ~/.vimrc.basic'
alias gvi='gvim -u ~/.vimrc.basic'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias nvi='nvim -u ~/.vimrc.basic'
alias vin='vim -u NONE'
alias F='| fzf'
alias td='tmux detach'
alias tmuxrc='$EDITOR ~/.tmux.conf'
alias sduo=sudo

# custom script to update path environment variable
[ -f $HOME/Scripts/bin/update_path ] && source $HOME/Scripts/bin/update_path

#vi mode
set editing-mode vi
bindkey -v

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[cyan]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}

# little zsh nuances
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# fzf scripts
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ $PATH != *"$HOME/.bin"* ]]; then
    export PATH="$PATH:$HOME/.bin"
fi
if [[ $PATH != *"$HOME/bin"* ]]; then
    export PATH="$PATH:$HOME/bin"
fi
export FZF_DEFAULT_COMMAND='rg --hidden -l ""' # show hidden files in fzf search by default

# alias & additional configuration
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
