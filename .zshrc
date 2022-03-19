#!/bin/sh

# PATH
PATH=$HOME/bin:/usr/local/bin:$PATH

ZINIT_HOME=~/.zinit

# Zsh
if [[ ! -d $ZINIT_HOME ]];then
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
autoload -Uz compinit
compinit

setopt auto_menu
setopt auto_cd
setopt auto_list
setopt auto_pushd
setopt auto_param_keys
setopt auto_param_slash
setopt auto_resume

setopt print_eight_bit
setopt pushd_ignore_dups
setopt no_flow_control
setopt ignore_eof
setopt correct
setopt interactive_comments
setopt list_packed
setopt magic_equal_subst
setopt mark_dirs
setopt prompt_subst

setopt append_history
setopt share_history
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_expand
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks

zinit ice wait'!0'; zplugin load zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zplugin load zsh-users/zsh-completions
zinit ice wait'!0'; zplugin load zsh-users/zsh-autosuggestions
zinit ice wait'!0'; zplugin load zsh-users/zsh-history-substring-search

zinit ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin
zinit load "mollifier/anyframe"
zinit load "b4b4r07/enhancd"
zinit load 'mollifier/cd-gitroot'
zinit ice pick"async.zsh" src"pure.zsh"; zinit load sindresorhus/pure

export LANG=ja_JP.UTF-8
export FZF_DEFAULT_OPTS='--color=fg+:11 --height 70% --reverse --select-1 --exit-0 --multi'

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:default' menu select=1
zstyle ':filter-select' case-insensitive yes
zstyle ':filter-select' extended-search yes
zstyle ':filter-select' hist-find-no-dups yes
zstyle ':filter-select' rotate-list yes

# Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
export GOENV_DISABLE_GOPATH=1

if [[ -d $HOME/.goenv ]];then
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$HOME/.goenv/bin:$PATH"
    export PATH="$GOROOT/bin:$PATH"
    eval "$(goenv init - zsh)"
fi

# Python
if [[ -d $HOME/.pyenv ]];then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init - zsh)"
fi

# PHP
if [[ -d $HOME/.phpenv ]];then
    export PHPENV_ROOT="$HOME/.phpenv"
    export PATH="$PHPENV_ROOT/bin:$PATH"
    eval "$(phpenv init - zsh)"
fi

# Google Cloud SDK.
if [[ -d $HOME/google-cloud-sdk ]];then
    source $HOME/google-cloud-sdk/path.zsh.inc
    source $HOME/google-cloud-sdk/completion.zsh.inc
fi

# Terraform
if type terraform >/dev/null 2>&1;then
    complete -o nospace -C /usr/local/bin/terraform terraform
fi

# Kubernetes
#if type kubectl >/dev/null 2>&1;then
#    source <(kubectl completion zsh)
#    alias -g k=kubectl
#    complete -o default -F __start_kubectl k

#    alias -g kgon='$(kubectl api-resources | fzf | awk "{print \$1}" | xargs k get | fzf | awk "{print \$1}" )'
#    alias -g kpf='k port-forward $(k get pods | fzf | awk "{print \$1}" ) 5000:5000'
#fi

# direnv
if type direnv >/dev/null 2>&1;then
    eval "$(direnv hook zsh)"
fi

# Git
git config --global user.useConfigOnly true
git config --global --unset user.email
git config --global --unset user.name
git config --global core.quotepath false

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
