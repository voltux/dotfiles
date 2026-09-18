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

plugins=(tmux fzf aliases jira common-aliases emoji git vi-mode archlinux docker colored-man-pages kubectl ubuntu z)
source $ZSH/oh-my-zsh.sh

# More history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups

# Preferred editor
command -v nvim &>/dev/null && export EDITOR='nvim' || export EDITOR='vim'

# vi mode
set editing-mode vi
bindkey -v

# Which display server is this shell talking to? $XDG_SESSION_TYPE is set by
# logind, but fall back to the sockets for the sessions where it is not
# (sway started straight from a tty, startx, ssh with forwarding, ...).
if [ -n "$WAYLAND_DISPLAY" ] || [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    DISPLAY_SERVER=wayland
elif [ -n "$DISPLAY" ] || [ "$XDG_SESSION_TYPE" = "x11" ]; then
    DISPLAY_SERVER=x11
else
    DISPLAY_SERVER=tty
fi

# Keyboard repeat rate, screen blanking and caps-lock-as-escape.
# Only X11 needs them here; see the wayland branch below.
case $DISPLAY_SERVER in
    x11)
        # $DISPLAY can point at XWayland even when the environment says x11 --
        # a tmux server started under an X11 session keeps handing its panes
        # DISPLAY=:0 and no WAYLAND_DISPLAY long after you log into sway.
        # XWayland has no DPMS extension and ignores setxkbmap, so ask the
        # server what it supports instead of letting these print errors.
        if command -v xset &> /dev/null; then
            # keyboard delay time
            xset r rate 200 50
            # never blank / power down the screen (needs the DPMS extension)
            if xset q 2>/dev/null | grep -q "^DPMS"; then
                xset -dpms
            fi
        fi
        # swap caps lock and escape if possible -- skipped under XWayland,
        # where the compositor owns the keymap (see ~/.config/sway/config)
        if command -v setxkbmap &> /dev/null \
            && ! xdpyinfo -queryExtensions 2>/dev/null | grep -q XWAYLAND; then
            setxkbmap -option caps:escape
        fi
        ;;
    wayland)
        # Nothing to do: the compositor owns the input devices, so the
        # equivalents live in ~/.config/sway/config instead -- repeat_delay /
        # repeat_rate and caps:escape in its "input type:keyboard" block, set
        # once at login rather than from every shell. (xset -dpms has no
        # counterpart: sway has no DPMS timer of its own.)
        ;;
esac

# little zsh nuances
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# add nvim mason installed binaries to path
if [[ $PATH != *"$HOME/.local/share/nvim/mason/bin"* ]]; then
    export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
fi

# gpg
export GPG_TTY=$(tty)

# fzf scripts
[ -f $HOME/.fzf/shell/completion.zsh ]\
    && source $HOME/.fzf/shell/completion.zsh\
    && [ -f $HOME/.fzf/shell/key-bindings.zsh ]\
    && source $HOME/.fzf/shell/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]\
    && source /usr/share/doc/fzf/examples/key-bindings.zsh\
    && [ -f /usr/share/doc/fzf/examples/completion.zsh ]\
    && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ]\
    && source /usr/share/fzf/key-bindings.zsh\
    && [ -f /usr/share/fzf/completion.zsh ]\
    && source /usr/share/fzf/completion.zsh

# add fzf to path

export FZF_DEFAULT_OPTS="--multi --border --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#1d2021,bg+:#3c3836
  --color=hl:#689d6a,hl+:#d79921,info:#458588,marker:#d79921
  --color=prompt:#b8bb26,spinner:#b16286,pointer:#d65d0e,header:#d3869b
  --color=border:#d79921,query:#d9d9d9
  --border="rounded" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆"'

if [[ $PATH != *"$HOME/.bin"* ]]; then
    export PATH="$PATH:$HOME/.bin"
fi
if [[ $PATH != *"$HOME/bin"* ]]; then
    export PATH="$PATH:$HOME/bin"
fi
if [[ $PATH != *"$HOME/.cargo/bin"* ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi
if [[ $PATH != *"$HOME/.local/bin"* ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi
if [[ $PATH != *"$HOME/.local/usr/bin"* ]]; then
    export PATH="$HOME/.local/usr/bin:$PATH"
fi

# check if rg is installed to modify default fzf mapping
if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg -l ""' # show hidden files in fzf search by default
fi

# alias & additional configuration
alias clear='clear -x'
[ -f ~/.zsh_alias ] && source ~/.zsh_alias

autoload zcalc

#Star Ship
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# create alias for fd if it is installed (needed for debian based distributions)
if command -v fdfind &> /dev/null ; then
    alias fd >/dev/null 2>&1 && unalias fd
    if [ ! -f "$HOME/.local/bin/fd" ] ; then
        ln -s $(which fdfind) "$HOME"/.local/bin/fd
    fi
fi

# ghcup-env
if [ -f "/home/iarapis/.ghcup/env" ]; then
    source "/home/iarapis/.ghcup/env"
fi

# ldgote
if command -v ldgote &> /dev/null ; then
    eval "$( ldgote completion zsh )"
fi

# restish
if command -v restish &> /dev/null ; then
    eval "$( restish completion zsh )"
fi

# paas-sdev
if command -v paas-sdev &> /dev/null ; then
    export PAAS_SDEV_ROOT=${HOME}/.paas-sdev
    export PAAS_SDEV_SRC=${PAAS_SDEV_ROOT}/src
    source <(paas-sdev env)
    eval "$( paas-sdev completion zsh )"
fi

# uv
if command -v uv &> /dev/null ; then
    eval "$(uv generate-shell-completion zsh)"
fi
