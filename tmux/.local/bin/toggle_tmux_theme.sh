#!/usr/bin/env sh
#
# Toggle the current window (all panes) between light and dark themes.
set -e

current_tmux_theme=$(tmux show -Av @tmux-gruvbox)

case $current_tmux_theme in
    "dark")
        # Change to the alternate window style.
        tmux set -g @tmux-gruvbox "light"
        ;;
    *)
        # Change back to the default window style.
        tmux set -g @tmux-gruvbox "dark"
        ;;
esac

tmux run "$HOME/.tmux/plugins/tpm/tpm"
