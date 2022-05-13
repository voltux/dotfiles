# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

# oh-my-zsh variable configuration
ZSH_THEME="voltus"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="%d/%m/%y %T"

plugins=(tmux common-aliases git vi-mode archlinux docker colored-man-pages kubectl ubuntu zsh-z)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

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

# add fzf to path
[ -f ~/.fzf.zsh ] \
    && source ~/.fzf.zsh \
    && export FZF_DEFAULT_OPTS="--multi --border --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"
if [[ $PATH != *"$HOME/.bin"* ]]; then
    export PATH="$PATH:$HOME/.bin"
fi
if [[ $PATH != *"$HOME/bin"* ]]; then
    export PATH="$PATH:$HOME/bin"
fi
if [[ $PATH != *"$HOME/.cargo/bin"* ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

# check if rg is installed to modify default fzf mapping
if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg -l ""' # show hidden files in fzf search by default
fi

# alias & additional configuration
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
