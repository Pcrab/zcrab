#!/bin/zsh

function zcrab-plugin-init () {
    if [ -f $ZCRAB/plugins/$1/$1.plugin.zsh ]; then
        source $ZCRAB/plugins/$1/$1.plugin.zsh
    fi
}

function zcrab-plugin-update () {
    echo "Updating $1 ..."

    if [ -f $ZCRAB/plugins/$1/$1.plugin.zsh ] || [ -d $ZCRAB/plugins/$1/.git ]; then
        cd $ZCRAB/plugins/$1
        git pull > /dev/null
        echo "finished"
        cd - > /dev/null
    fi

}
