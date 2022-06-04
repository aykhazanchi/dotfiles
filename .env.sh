#!/usr/bin/env sh

# Add commonly used folders to $PATH
export VIRTUAL_ENV_DISABLE_PROMPT=
export LC_CTYPE=en_GB.UTF-8
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.tgenv/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Add brew to path
eval "$(/opt/homebrew/bin/brew shellenv)"

# nvm
export NVM_DIR="$HOME/.nvm"

# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=vim

# jenv
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"
#jenv add $(/usr/libexec/java_home)

# pyenv
export PATH="$(pyenv root)/shims:$PATH"
eval "$(pyenv init -)"

# ssh-keys
#zstyle :omz:plugins:ssh-agent identities ~/workspace/keys/aws/{aws-play.cer,aws.pem}
zstyle :omz:plugins:ssh-agent identities ~/workspace/keys/git/{akzn}
zstyle :omz:plugins:ssh-agent agent-forwarding yes
ssh-add ~/workspace/keys/git/akzn

# Brew command-not-found
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi

# Rust cargo
. "$HOME/.cargo/env"

# Minikube docker env
eval $(minikube docker-env)

# aliases
alias zshrc="vim ~/.zshrc"
alias c="cd"
alias pip="pip3"
alias weather="curl wttr.in?0"
alias my-ip-int="ifconfig -l | xargs -n1 ipconfig getifaddr"
alias my-ip-ext="curl ifconfig.me"
alias grep="grep --color"
alias gt="git"
alias ll="ls -lFh"
alias la="ls -laFh"

# alias function
mk(){ mkdir -p "$1" && cd "$1"; }
