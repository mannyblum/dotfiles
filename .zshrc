# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

source ~/.bin/base16-tomorrow.dark.sh
source ~/.localrc
source ~/.git-flow-completion.zsh
unsetopt correct

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kolo"
ZSH_THEME="muse"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast git django med pip fuck tmux fasd ack)

source $ZSH/oh-my-zsh.sh

# aliases
alias vim='/usr/local/Cellar/vim/7.4.253/bin/vim'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias tmux="TERM=screen-256color-bce tmux -2"

# Make sure Ctrl-R works
bindkey '^R' history-incremental-search-backward

export TERM="screen-256color"

eval "$(fasd --init posix-alias zsh-hook)"

# Customize to your needs...
#export PATH=/home/vagrant/bin:/home/vagrant/bin:/home/vagrant/bin:/home/vagrant/bin:/usr/local/Cellar/node/0.6.15:/usr/local/Cellar/ruby/1.9.2-p290/bin:/usr/local/mongodb/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/node/0.6.15:/usr/local/Cellar/ruby/1.9.2-p290/bin:/usr/local/mongodb/bin:/usr/local/bin:/usr/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/share/npm/bin

export PATH=/usr/local/Cellar/node/2.6.15:/usr/local/Cellar/ruby/1.9.2-p290/bin:/usr/local/mongodb/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/node/0.6.15:/usr/local/Cellar/ruby/1.9.2-p290/bin:/usr/local/mongodb/bin:/usr/local/bin:/usr/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/share/npm/bin:/usr/local/Cellar/git/1.9.2/libexec/git-core:$PATH

skip_global_compinit=1

zstyle ':completion:*' users {manny,root}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
