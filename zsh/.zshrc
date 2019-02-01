# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZDOTDIR/custom"

ZSH_THEME="avit"
plugins=(git lein colored-man-pages docker z cat direnv)

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS='yyyy-mm-dd'

source $ZSH/oh-my-zsh.sh

PROMPT="
%F{cyan}%T ${PROMPT}"

##################################
# Source all files in .zshrc_local
##################################
for f in $ZDOTDIR/.zshrc_local/*.sh; do
    . $f
done 2> /dev/null
