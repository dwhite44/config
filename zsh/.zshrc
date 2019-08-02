# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load the oh-my-zsh's library.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZDOTDIR/custom"

# Bundles from the default repo (robbyrussell's oh-my-zsh).
plugins=(git lein colored-man-pages docker zsh-syntax-highlighting adb cat direnv brew rbenv)

# Load the theme.
ZSH_THEME='avit'

source $ZSH/oh-my-zsh.sh

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS='yyyy-mm-dd'

PROMPT="
%F{cyan}%T ${PROMPT}"

##################################
# Source all files in .zshrc_local
##################################
for f in $ZDOTDIR/.zshrc_local/*.sh; do
    . $f
done 2> /dev/null
