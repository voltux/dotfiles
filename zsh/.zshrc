# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

# Generic environment variables
export WALLPAPER="/usr/share/wallpapers/arch_against_others.png"
export BROWSER="/usr/bin/firefox"
export TERMINAL="terminator"

#colors for less
#export LESS_TERMCAP_mb=$'\e[1;32m'
#export LESS_TERMCAP_md=$'\e[1;32m'
#export LESS_TERMCAP_me=$'\e[0m'
#export LESS_TERMCAP_se=$'\e[0m'
#export LESS_TERMCAP_so=$'\e[01;33m'
#export LESS_TERMCAP_ue=$'\e[0m'
#export LESS_TERMCAP_us=$'\e[1;4;34m'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="voltus"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(tmux common-aliases git vi-mode archlinux docker colored-man-pages)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# MAIL
#MAIL=/home/voltus/mail/voltus

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#voltus aliases
alias l='ls -lh'
alias ll='ls -lh'
alias la='ls -lha'
alias sl=ls
alias haskell=ghci
alias vimrc='vim ~/.vimrc'
alias vi='vim -u ~/.vimrc.basic'
alias gvi='gvim -u ~/.vimrc.basic'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias nvi='nvim -u ~/.vimrc.basic'
alias vin='vim -u ~/.vimrc.basic'
alias F='| fzf'
alias sl=ls
alias td='tmux detach'
alias iconfig='$EDITOR ~/.config/i3/config'
alias muttrc='$EDITOR ~/.muttrc'
alias tmuxrc='$EDITOR ~/.tmux.conf'
alias setwallpaper='feh --bg-scale $WALLPAPER'
alias sduo=sudo
alias svd="svn diff --diff-cmd colordiff"
alias svst="svn status"
alias svi="svn info"
alias svco="svn checkout"
alias svu="svn update"
alias svc="svn commit -m"

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

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# fzf scripts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ $PATH != *"$HOME/.bin"* ]]; then
    export PATH="$PATH:$HOME/.bin"
fi

xset b off

source ~/.zsh_alias
