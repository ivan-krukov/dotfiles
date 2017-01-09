#A right-aligned theme
ZSH_THEME_GIT_PROMPT_DIRTY="%F{yellow}±%f"
ZSH_THEME_GIT_PROMPT_PREFIX=" ["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"

function span {
	local right_prompt="[%3~] [%n@%m:%y]"
	local prompt_length=${#${(%):-$right_prompt}}
	print ${(l:(($COLUMNS-1-$prompt_length)):: :)}
}

local return_code="%(?.. [%F{red}%?↵%f])"

setopt prompt_subst

PROMPT='$(span)[%F{yellow}%3~%f] [%F{blue}%n@%m:%y%f]
 '
RPROMPT='[%F{magenta}%D{%K:%M}%f] [%F{green}%h%f]$(git_prompt_info)${return_code}'

#│${(l:(($COLUMNS-3)):: :)}│
