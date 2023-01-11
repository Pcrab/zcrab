hashColor=${gitHashColor:-"magenta"}
contentColor=${gitContentColor:-"cyan"}
dateColor=${gitDateColor:-"yellow"}
authorColor=${gitAuthorColor:-"blue"}

alias gco='git checkout'
alias gpo='git push origin $(git symbolic-ref --short -q HEAD)'
alias gpl='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
alias gd='git --no-pager diff'
alias gs='git --no-pager status'
alias gss='git --no-pager status -s'
alias gpt='git push origin --tags'
alias glt='git tag -n --sort=taggerdate | tail -n ${1-10}'
gat() { git tag -a $1 -m "$2" }
gam() { git add --all && git commit -m "$*" }
gitlog() {
    git --no-pager log --date=format:'%Y-%m-%d %H:%M'  --pretty=format:$1 --graph -n ${2-10} \
}
gll() { gitlog "%C(${hashColor})%h %C(${contentColor})%s%Creset" $1 }
glll() { gitlog "%C(${hashColor})%h %C(${dateColor})%cd %C(${authorColor})%cn: %C(${contentColor})%s%Creset" $1 }

alias vim='nvim'

alias ls='exa'
alias l='ls -lh'
alias la='ls -lah'

alias cc='cd ${HOME}/Code'
alias cn='cd ${XDG_CONFIG_HOME}/nvim'
alias cz='cd ${ZDOTDIR}'

alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

alias cr='clear; reset'
