# auto update the terminal name
_apply_preexec_hook() {
    preexec_hook() { _cmd=($(echo $2)); print -n "\e]2;${(q)_cmd[1]}\a"; }
    add-zsh-hook -Uz preexec preexec_hook
}

# auto to last pwd
_apply_chpwd_hook() {
    mkdir -p $XDG_CACHE_HOME/zsh/
    chpwd_hook() { echo $PWD > $XDG_CACHE_HOME/zsh/currentdir }
    add-zsh-hook -Uz chpwd chpwd_hook
    currentdir=$(cat $XDG_CACHE_HOME/zsh/currentdir 2>/dev/null)
    [ -d "$currentdir" ] && cd $currentdir
}

_apply_preexec_hook
_apply_chpwd_hook
