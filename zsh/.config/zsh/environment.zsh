# ENVIRONMENT

# timestamps
#HIST_STAMPS=mm/dd/yyyy

export XDG_CONFIG_HOME="$HOME"/.config
export XAPPLRESDIR="$XDG_CONFIG_HOME"/urxvt/
export GOPATH="$HOME"/.local/lib/go
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CACHE_HOME="$HOME"/.local/cache
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:=/tmp}"
#export ZDOTDIR="$HOME"/.config/zsh # set in /etc/zsh/zshenv
export GNUPGHOME="$XDG_DATA_HOME"/gpg
export CARGO_HOME="$HOME"/.local/lib/cargo
export RUSTUP_HOME="$HOME"/.local/lib/rustup
export TIN_HOMEDIR="$XDG_CONFIG_HOME"/tin

# paths
export GOPATH=$HOME/.local/lib/go
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin:$HOME/.gem/ruby/2.6.0/bin:$CARGO_HOME/bin:$GOPATH:$XDG_DATA_HOME/nvim/mason/bin
export TF_PLUGIN_CACHE_DIR=$XDG_CACHE_HOME/tf_plugin

# preferred editor for local and remote sessions
export EDITOR=vim
export VISUAL=vim

# password store
export PASSWORD_STORE_DIR=$HOME/.local/src/password-store

# lynx colours
export LYNX_LSS=$HOME/.config/lynx/lynx.lss

# language
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

set -o vi
