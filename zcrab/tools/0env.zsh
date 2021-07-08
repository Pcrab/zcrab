#!/bin/zsh

export BW_SESSION="DkuXtaHMO1qrhWyWSI+B84aL29bjwc/k5GTKR/hqn+zMvOSX+ylEqShvPVvqIBxgtYzQk7r6U1ZgWIocm+JtNw=="
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME"/ccache.config
export CCACHE_DIR="$XDG_CACHE_HOME"/ccache

#OPENSSL
export CPATH=/usr/local/opt/openssl/include
export LIBRARY_PATH=/usr/local/opt/openssl/lib
# QT
export LDFLAGS="-L/usr/local/opt/qt/lib -L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include -I/usr/local/opt/openblas/include"
export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig /usr/local/opt/openblas/lib/pkgconfig"

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

export GOPATH=$HOME/.local/go
export GOPROXY="https://goproxy.cn"
export GO111MODULE="auto"

# export RUSTUP_HOME="$XDG_CONFIG_HOME/rustup"
# export CARGO_HOME="$XDG_CONFIG_HOME/cargo"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890

export EDITOR="/usr/local/bin/nvim"

export PATH="$HOME/.cargo/bin/:$HOME/node_modules/yarn/bin:/usr/local/go/bin/:/usr/local/opt/openjdk/bin:/usr/local/Cellar/llvm/11.0.0/bin:$GOPATH/bin:/usr/local/Cellar/r/4.0.3/bin/:$PATH"
