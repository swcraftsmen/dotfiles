#!/usr/bin/env bash

DOT_DIR=$HOME/.dotfiles
FZF_HOME=$HOME/.fzf
FZF_AUTO_COMPLETION=$FZF_HOME/shell/completion.bash

[ -e "${DOT_DIR}/.aliases" ] && source "${DOT_DIR}/.aliases"
[ -e "${DOT_DIR}/.bash_prompt" ] && source "${DOT_DIR}/.bash_prompt"

# fzf
export PATH=$PATH:$FZF_HOME/bin
[ -e $FZF_AUTO_COMPLETION ] && source $FZF_AUTO_COMPLETION


# For more detail about the following setting referring
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

# case-insensitive
shopt -s nocaseglob

# append the histroy instead of override the file
shopt -s histappend

# correct minor spelling error when using the cd
shopt -s cdspell
