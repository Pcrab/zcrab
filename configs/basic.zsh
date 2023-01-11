# Starship Prompt
(( $+commands[starship] )) || (curl -sS https://starship.rs/install.sh | sh && mkdir $HOME/.config && starship preset nerd-font-symbols > $HOME/.config/starship.toml)
eval "$(starship init zsh)"

autoload -Uz add-zsh-hook
zmodload -i zsh/complist
unsetopt correct

autoload -U compaudit compinit
autoload -U compinit && compinit

# History
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS INC_APPEND_HISTORY
HISTFILE=~/.zsh_history
export HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=10000
SAVEHIST=1000

setopt AUTO_PUSHD AUTO_CD AUTO_LIST AUTO_LIST PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS

# Keybindings
bindkey -e
bindkey '^R' history-incremental-search-backward      # [C-r]: Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^S' history-incremental-search-forward       # [C-s]: Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.

bindkey ' ' magic-space                               # [<SPC>]: do history expansion
bindkey '^[[1;5C' forward-word                        # [<C-RightArrow>]: move forward one word
bindkey '^[[1;5D' backword-word                       # [<C-LeftArrow>]: move backward one word
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [<S-Tab>]: move through the completion menu backwards
fi
bindkey '^?' backward-delete-char                     # [<BS>]: delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [<DEL>]: delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line                  # [<C-x><C-e>]: Open $EDITOR to edit command
bindkey "^[m" copy-prev-shell-word
bindkey '^H' backward-kill-word

setopt MULTIOS PROMPT_SUBST
export GIT_TERMINAL_PROMPT=1
