ZTHEMEDIR=$ZCRAB/themes

theme_list=()
for random_theme in $ZTHEME_RANDOM
do
    # Ignore random and default.
    if [ "$random_theme" = "random" ] || [ "$random_theme" = "default" ]; then
        continue
    fi
    if [ -f $ZTHEMEDIR/$random_theme.zsh ]; then
        # zsh array start from 1.
        theme_list[`expr ${#theme_list[@]} + 1`]=$random_theme
    fi
done

# If theme_list is empty.
if [[ $#theme_list[@] -eq 0 ]]; then
    if [[ ${#ZTHEME_RANDOM[@]} -ne 0 ]]; then
        echo "There is something wrong with your random theme list. Please check it."
    fi
    theme_list=(`ls $ZTHEMEDIR/ | grep -Ev "default|random" | awk -F '/' ' { sub(/\.zsh\$/, "" ); print $NF}'`)
fi

num=$#theme_list[@]
num=`expr $RANDOM % $num + 1`
source $ZCRAB/themes/$theme_list[$num].zsh
CURRENT_ZTHEME=$theme_list[$num]
unset random_theme num theme_list
