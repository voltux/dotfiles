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

plugins=(tmux fzf fd aliases jira ripgrep common-aliases emoji git vi-mode archlinux docker colored-man-pages kubectl ubuntu z)
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

# keyboard delay time
if command -v xset &> /dev/null; then
    xset r rate 200 50
fi

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

#swap caps lock and escape if possible
if command -v setxkbmap &> /dev/null; then
    setxkbmap -option caps:escape
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
#compdef ldgote
compdef _ldgote ldgote

# zsh completion for ldgote                               -*- shell-script -*-

__ldgote_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_ldgote()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16
    local shellCompDirectiveKeepOrder=32

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
    local -a completions

    __ldgote_debug "\n========= starting completion logic =========="
    __ldgote_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __ldgote_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __ldgote_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., ldgote -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __ldgote_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __ldgote_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __ldgote_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __ldgote_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __ldgote_debug "No directive found.  Setting do default"
        directive=0
    fi

    __ldgote_debug "directive: ${directive}"
    __ldgote_debug "completions: ${out}"
    __ldgote_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __ldgote_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __ldgote_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __ldgote_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __ldgote_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __ldgote_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __ldgote_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
        __ldgote_debug "Activating keep order."
        keepOrder="-V"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __ldgote_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __ldgote_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __ldgote_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __ldgote_debug "Calling _describe"
        if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
            __ldgote_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __ldgote_debug "_describe did not find completions."
            __ldgote_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __ldgote_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __ldgote_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_ldgote" ]; then
    _ldgote
fi
