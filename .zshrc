#  ===========================
# |                    _      |
# |  _______ ____ __ _| |__   |
# | |_  / __| ___/ _| | '_ \  |
# |  / / (__| | | (_| | |_) | |
# | /___\___|_|  \__,_|_.__/  |
# |                           |
#  ===========================
#
# Set zcrab home directory.
ZCRAB=$ZDOTDIR/zcrab

# Set zsh theme.
# You can find all options in $HOME/.config/zsh/zcrab/themes .
# Or you can simply fill in "random" to get a different theme everytime you start zsh.
ZTHEME="asdf"
# If ZTHEME is set to random, than zcrab will loop themes listed in this array.
# If it is empty, zcrab will loop from all themes.
ZTHEME_RANDOM=()

# Set what plugins to enable. They must be in plugins dir.
ZPLUGINS="zsh-syntax-highlighting"

# Set n to disable auto update
AUTO_UPDATE="true"

# Uncomment to enable VI mode
VI_MODE="true"

# Uncomment this line to disable update prompt
# DISABLE_UPDATE_PROMPT="true"

# Set update frequency (in days)
UPDATE_FREQUENCY=7

source $ZCRAB/zcrabrc.zsh

# Add your custom configurations here.
# All your customizations here will overwrite those provided by default, like aliases.


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
