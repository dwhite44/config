#####################################################################
# Source custom scripts
#####################################################################
if (( ${+HAS_ADB} )); then . $ZSCRIPTS/adb.sh; fi
if (( ${+HAS_BREW} )); then . $ZSCRIPTS/brew_paths.sh; fi
if (( ${+HAS_CCAT} )); then . $ZSCRIPTS/ccat.sh; fi
if (( ${+HAS_DIRENV} )); then . $ZSCRIPTS/direnv.sh; fi
if (( ${+HAS_RBENV} )); then . $ZSCRIPTS/rbenv.sh; fi
# ZSH Syntax Highlighting will only be enabled on login shells. Move to
# .zshrc if that becomes an issue
if (( ${+HAS_ZSH_SYNTAX_HIGHLIGHTING} )); then . $ZSCRIPTS/zsh_syntax_highlighting.sh; fi

# enable C-s forward search
[[ $- == *i* ]] && stty -ixon

# enable up down history and place cursor at end of text
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

#####################################################################
# Source all files in .zprofile_local
# Scripts not in source-control. Machine-specific
#####################################################################
for f in $ZDOTDIR/.zprofile_local/*.sh; do
    . $f
done 2> /dev/null
