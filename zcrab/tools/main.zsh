#!/bin/zsh
function zcrab () {

    function theme () {
        # Tell user current theme.
        # List all theme in a array. Easy to get.
        # Set random at the end.
        local all_themes=(`ls $ZCRAB/themes/ | grep -Ev "default|random" | awk -F '/' ' { sub(/\.zsh\$/, "" ); print $NF}'` default random)

        # List all themes. No argument is required.
        function list-theme () {
            echo "Current theme is ${YELLOW}${BOLD}$ZTHEME.${RESET}"
            local no=1
            for theme in $all_themes; do
                printf "[${YELLOW}$no${RESET}] $theme"
                if [ "$ZTHEME" = "$theme" ]; then
                    printf " ${RED}${BOLD}*${RESET}"
                fi
                printf "\n"
                no=`expr $no + 1`
            done
            unset theme
        }

        # Set theme. No argument or one number is required.
        function set-theme () {
            # With no argument.
            if [ -z "$1" ]; then
                list-theme
                printf "Please select the theme you like: "
                while true
                do
                    read theme
                    if [[ $theme -gt 0 ]] || [[ $theme -le $#{all_themes} ]]; then
                        ZTHEME=$all_themes[$theme]
                        # Write change to .zshrc
                        sed -i "s/^ZTHEME=\".*\"$/ZTHEME=\"$ZTHEME\"/g" $ZDOTDIR/.zshrc
                        source $ZCRAB/themes/$ZTHEME.zsh
                        echo "Change your theme to ${YELLOW}${BOLD}$ZTHEME${RESET} succeeded"
                        unset theme
                        return
                    else
                        echo "You have entered a wrong number. Exiting..."
                    fi
                done
            else
                if [ -f $ZCRAB/themes/$1.zsh ]; then
                    ZTHEME=$1
                else
                    ZTHEME=default
                    echo "You set a wrong theme. Fall back to default theme."
                fi
                sed -i "s/^ZTHEME=\".*\"$/ZTHEME=\"$ZTHEME\"/g" $ZDOTDIR/.zshrc
                source $ZCRAB/themes/$ZTHEME.zsh
                echo "Change your theme to ${YELLOW}${BOLD}$ZTHEME${RESET} succeeded"
            fi
        }

        # Check arguments.
        # If first argument is list or set, then exec correctly,
        if [ "$1" = "list" ] || [ "$1" = "set" ]; then
            $1-theme $2
        # If do not have any argument, then need to switch what to do.
        elif [ -z "$1" ]; then
            echo "[1] List all themes"
            echo "[2] Set theme"
            printf "Please select what you want to do: "
            read no
            case "$no" in
                "1")
                    list-theme
                    ;;
                "2")
                    set-theme
                    ;;
                *)
                echo "You have entered a wrong number. Exiting..."
                    ;;
            esac
        # Any other argument will be considered mistype.
        else
            echo "Wrong argument \"$1\". Please use zcrab --help to view man page."
            return 1
        fi

        unset all_themes
    }






    function plugin () {

        local all_plugins=()
        function is-plugin() {
            builtin test -f $ZCRAB/plugins/$1/$1.plugin.zsh
        }

        function in-plugin-list () {
            builtin test "$pl" = "$1"
        }

        function list-plugin () {

            num=1
            for plugin in `ls $ZCRAB/plugins/`; do
                if is-plugin $plugin; then
                    all_plugins[`expr ${#all_plugins[@]} + 1`]=$plugin
                    echo -e "[${YELLOW}${BOLD}$num${RESET}] $plugin\c"
                    for pl in $ZPLUGINS; do
                        if in-plugin-list $plugin; then
                            echo -e " ${BOLD}${RED}*${RESET}\c"
                        fi
                    done
                    echo
                    num=`expr $num + 1`
                fi
            done
            unset plugin num
        }

        function set-plugin () {
            list-plugin
            echo "Please select what plugin you want to change its status."
            read plu
            if [[ $plu -gt 0 ]] || [[ $plu -le $#{all_plugins[@]} ]]; then
                ZPLUGINS=(${ZPLUGINS[@]/$all_plugins[$plu]/})
                sed -i "s/^ZPLUGINS=(.*)$/ZPLUGINS=\"${ZPLUGINS[@]}\"/g" $ZDOTDIR/.zshrc
            fi
            echo "Please open ${BOLD}${RED}another${RESET} terminal to make this change take effect."
        }

        # Check arguments.
        # If first argument is list or set, then exec correctly,
        if [ "$1" = "list" ] || [ "$1" = "set" ]; then
            $1-plugin $2
        # If do not have any argument, then need to switch what to do.
        elif [ -z "$1" ]; then
            echo "[1] List all plugins"
            echo "[2] Set plugin status"
            printf "Please select what you want to do: "
            read no
            case "$no" in
                "1")
                    list-plugin
                    ;;
                "2")
                    set-plugin
                    ;;
                *)
                echo "You have entered a wrong number. Exiting..."
                    ;;
            esac
        # Any other argument will be considered mistype.
        else
            echo "Wrong argument \"$1\". Please use zcrab --help to view man page."
            return 1
        fi

    }








    if [[ $# -gt 3 ]]; then
        echo "Too many arguments. Please use zcrab --help to view man page."
    else
        if [[ $# -eq 0 ]]; then
            echo "What do you want to do?"
            echo "[1] Theme"
            echo "[2] Plugins"
            printf "Pleas select one to continue: "
            read num

            if [ "$num" = "1" ]; then
                theme
            elif [ "$num" = "2" ]; then
                plugin
            else
                echo "You have entered a wrong number. Exiting..."
                unset num
                return 1
            fi
            return
        fi
        case "$1" in
            "theme")  theme $2 $3
                ;;
            "plugin") plugin $2 $3
                ;;
            *)
                echo "Wrong argument \"$1\". Please use zcrab --help to view man page."
                return 1
                ;;
        esac
    fi
}
