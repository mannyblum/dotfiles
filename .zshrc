# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="norm"
#ZSH_THEME="norm"

virtual_envs=(/Users/mblum/devel)

plugins=(git brew django med pip vi-mode mercurial)

source $ZSH/oh-my-zsh.sh

# I hate auto correct too ...
unsetopt correctall

# Customize to your needs...
export PATH=/Users/mblum/bin:/Users/mblum/local/bin:/Users/mblum/bin:/usr/local/pgsql/bin:/usr/local/mongodb/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/mblum/local/bin:/usr/local/pgsql/bin:/usr/local/mongodb/bin:/usr/local/sbin:/usr/local/mysql/bin

alias vim="/usr/local/bin/vim"
alias vi="/usr/local/bin/vim"
alias sites="cd ~/Sites"
alias top='top -ocpu'
alias tmux='tmux -2'
alias localenv='. env/bin/activate'
alias fixkb='setxkbmap -option ctrl:nocaps'

# Build/Compile Correctly
export ARCHFLAGS="-arch i386 -arch x86_64"

# CMG specific
export DEVELDIR=/Users/mblum/devel
export CMG_LOCAL_VIRTUALENV_VERSION=1

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  NORMAL_MODE="%{$fg[yellow]%}n%{$reset_color%}"
  INSERT_MODE="%{$fg[cyan]%}i%{$reset_color%}"
fi

function zle-line-init zle-keymap-select {
 VIMODE="${${KEYMAP/vicmd/[$NORMAL_MODE]}/(main|viins)/[$INSERT_MODE]}"
 zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v

# Make sure Ctrl-R works
bindkey '^R' history-incremental-search-backward

# Make backspace work like vim
bindkey '^?' backward-delete-char

# Prompt
#PROMPT='%{$fg[cyan]%}%n@mac $(git_prompt_info)%{$fg[yellow]%}%~ 
#%{$reset_color%}${VIMODE}$ '
