#/bin/zsh

# ls
alias \
    ls="lsd" \
    l="lsd -lah" \
    ll="lsd -lh"

# shortcut
alias \
    c="clear" \
    re="reset" \
    sdn="doas shutdown -h now" \
    gcpp="g++ -Wall -std=c++14"

# rename
alias \
    top="htop -t" \
    grep="grep --color=auto" \
    md2pdf='pandoc --pdf-engine=xelatex --template=pm-template.tex' \
    vim="/usr/local/bin/vim" \
    wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'" \
    cat="bat" # vim="nvim" \

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
    rm="rm -iv" \
    cp="cp -iv" \
    mv="mv -iv"
# go
alias \
    cg="cd $GOPATH/src/pcrab.xyz/pcrab/" \
    cv="cd $HOME/.vim/" \
    cn="cd $XDG_CONFIG_HOME/nvim/" \
    cz="cd $XDG_CONFIG_HOME/zsh/" \
    cb="cd $XDG_DATA_HOME/hugo-blog/" \
    ct="cd $XDG_DATA_HOME/hugo-blog/themes/crabquark/"

# gpg
alias \
    cs="gpg --card-status"

# tmux
alias \
    tl="tmux ls" \
    tn="tmux new -s" \
    ta="tmux a -t"
