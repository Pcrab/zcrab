#!/bin/zsh
# This is zcrab main control file, used to configure basic zsh behavior and zcrab functions.

# add color
source $ZCRAB/tools/set-colors.zsh
autoload -U colors && colors

# Useful settings
setopt autocd # Automatically cd into typed directory.
stty stop undef # Disable ctrl-s to freeze terminal.

# Tab enhancement
autoload -U compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)   # Include hidden files
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

for tool in `ls $ZCRAB/tools/`; do
    source $ZCRAB/tools/$tool
done

open-vi-mode
zcrab theme set $ZTHEME > /dev/null 2>&1

# History
HISTSIZE=10000
SAVEHIST=10000

# Default apps
export TERMINAL="alacritty"
export BROWSER="firefox"
export PATH="$PATH:$HOME/.local/bin:$HOME/.config/yarn/global/node_modules/hexo-cli/bin:$GOROOT/bin:$GOPATH/bin"


for plugin in `ls $ZCRAB/plugins/`; do
    source $ZCRAB/plugins/$plugin/$plugin.zsh
done

for custom in `ls $ZCRAB/custom/`; do
    source $ZCRAB/custom/$custom/$custom.zsh
done
unset plugin tool custom
