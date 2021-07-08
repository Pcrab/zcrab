#!/bin/zsh
function isCmdExist() {
    local cmd="$1"
    which "$cmd" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        return 0
    fi
    echo "${BOLD}${RED}Warning: ${YELLOW}\"$1\"${RESET} does not exist on the machine. Please install it and try again."
    finish 1
}

function setColor() {
    RED=$(printf '\033[31m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    BLUE=$(printf '\033[34m')
    BOLD=$(printf '\033[1m')
    RESET=$(printf '\033[m')
}

function cloneDir() {
    echo "${BOLD}>${RESET} git clone https://github.com/Pcrab/zcrab $HOME/.config/zsh"
    git clone https://github.com/Pcrab/zcrab $HOME/.config/zsh
}

function finish() {
    unset RED GREEN YELLOW BLUE BOLD RESET
    unfunction isCmdExist setColor cloneDir
    exit $1
}

setColor

isCmdExist git
isCmdExist zsh

if [[ ! -d $HOME/.config/zsh ]] {
    cloneDir
} else {
    echo "${BOLD}${YELLOW}ZCRAB${RESET} has already been installed. Do you want to make a backup? Y/n"
    read will
    if [[ "n" == will || "N" == will ]] {
        echo "You have pressed ${BOLD}${RED}$will${RESET}, do you want to force overwrite the directory? y/N"
        read will
        if [[ "y" == will || "Y" == will ]] {
            echo "Do you ${BOLD}sure ${RED} overwrite the directory${RESET} is what you want? y/N"
            if [[ "y" == will || "Y" == will ]] {
                rm -r $HOME/.config/zsh
                cloneDir
            }
        } else {
            finish 1
        }
    } else {
        echo "${BOLD}>${RESET} cp -rv $HOME/.config/zsh $HOME/.config/zshbak"
        cp -r $HOME/.config/zsh $HOME/.config/zshbak
        while (( $? != 0 )) {
            echo "Something wrong has happened during backup. Do you want to try again? Y/n"
            read will
            if [[ "n" == will || "N" == will ]] {
                rm -r $HOME/.config/zsh
                break
            }
            echo "${BOLD}>${RESET} cp -rv $HOME/.config/zsh $HOME/.config/zshbak"
            cp -r $HOME/.config/zsh $HOME/.config/zshbak
        }
        cloneDir
    }
    unset will
}

cat <<EOF >$HOME/.zshenv
ZDOTDIR=$HOME/.config/zsh
EOF

echo $SHELL | grep zsh >> /dev/null
if (( $? != 0 )) {
    echo "Current Shell is not ${BOLD}${YELLOW}zsh${RESET}."
}

cat <<EOF >$HOME/.config/zsh/.zshrc
ZCRAB=\$ZDOTDIR/zcrab

# Set zsh theme.
# You can find all options in \$HOME/.config/zsh/zcrab/themes .
# Or you can simply fill in "random" to get a different theme everytime you start zsh.
ZTHEME="asdf"
# If ZTHEME is set to random, than zcrab will loop themes listed in this array.
# If it is empty, zcrab will loop from all themes.
ZTHEME_RANDOM=()

# Set what plugins to enable. They must be in plugins dir.
ZPLUGINS=()

# Uncomment to enable VI mode
VI_MODE="false"

source \$ZCRAB/zcrabrc.zsh

# Add your custom configurations here.
# All your customizations here will overwrite those provided by default, like aliases.
EOF

mkdir $HOME/.config/zsh/zcrab/custom
mkdir $HOME/.config/zsh/zcrab/plugins

source $HOME/.zshenv
source $ZDOTDIR/.zshrc




echo "${BOLD}Install finished successfully. Please enjoy!${RESET}"
finish 0

