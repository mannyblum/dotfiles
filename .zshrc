# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="norm"
ZSH_THEME="pygmalion"

plugins=(git brew django med pip vi-mode mercurial)

source $ZSH/oh-my-zsh.sh

# I hate auto correct too ...
unsetopt correctall

# Customize to your needs...
source ~/.localrc

alias top='top -ocpu'
alias tmux='tmux -2'
alias localenv='. env/bin/activate'
alias fixkb='setxkbmap -option ctrl:nocaps'


# Build/Compile Correctly
export ARCHFLAGS="-arch i386 -arch x86_64"

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
