# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ANTIGEN_PATH

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
export ZSH_CUSTOM="$ZDOTDIR/custom"

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle lein
antigen bundle colored-man-pages
antigen bundle docker

# zsh-users repo bundles
antigen bundle zsh-users/zsh-syntax-highlighting

#Custom bundles
antigen bundle $ZSH_CUSTOM/plugins/cat --no-local-clone
antigen bundle $ZSH_CUSTOM/plugins/direnv --no-local-clone

# Load the theme.
antigen theme avit

# Tell Antigen that you're done.
antigen apply

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
