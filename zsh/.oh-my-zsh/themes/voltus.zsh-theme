local ret_status="%(?:%{$fg_bold[cyan]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='╭─%{$fg[magenta]%}%n%{$fg[blue]%}@%{$fg[green]%}%M %{$fg[yellow]%}%~ $(git_prompt_info)
╰${ret_status} %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
