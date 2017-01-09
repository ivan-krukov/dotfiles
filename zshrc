# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/ivan/.oh-my-zsh

ZSH_THEME="gnzh"

HYPHEN_INSENSITIVE="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/share/man:$MANPATH"
export PATH=$HOME/anaconda3/bin:$HOME/bin:$PATH
export PERL5LIB=/usr/local/lib/perl5/site_perl:${PERL5LIB}

# VI mode additions
#bindkey "^[OA" history-beginning-search-backward
#bindkey "^[OB" history-beginning-search-forward

# Table viewing
function view_tsv {
	column -s '	' -t $1 | less -S -N
}

function view_csv {
	column -s ',' -t $1 | less -S -N
}

# FZF settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Vim settings
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#Disable ctrl-s
stty -ixon
