#/bin/zsh

# ls
alias \
    ls="exa" \
    la="exa -lahg" \
    l="exa -lahg" \
    ll="exa -lhg"

# shortcut
alias \
    c="clear" \
    r="reset" \
    sdn="doas shutdown -h now"\
    gcpp="g++ -Wall -std=c++14"

# rename
alias \
    top="htop -t" \
    grep="grep --color=auto" \
    pandocn='pandoc --pdf-engine=xelatex -V CJKmainfont="Source Han Sans SC"' \
    doas="doas --" \
    vim="nvim" \
    wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

# apps
alias \
    lg="lazygit" \
    za="zathura" \
    nb="newsboat" \
    bt="bashtop"

# Youtube
alias \
    yv="youtube-viewer" \
    yd="youtube-dl --add-metadata -i"

# for secure
alias \
    rm="rm -Iv" \
    cp="cp -iv" \
    mv="mv -iv"
# go
alias \
    cg="cd ~/.local/go/src/git/pcrab/" \
    cv="cd $HOME/.vim/"\
    cn="cd $XDG_CONFIG_HOME/nvim/"\
