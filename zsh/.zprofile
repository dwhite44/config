#####################################################################
# Source custom scripts
#####################################################################
if (( ${+HAS_ADB} )); then . $ZDOTDIR/zprofile_scripts/adb.zsh; fi
if (( ${+HAS_BREW} )); then . $ZDOTDIR/zprofile_scripts/brew_paths.zsh; fi
if (( ${+HAS_CCAT} )); then . $ZDOTDIR/zprofile_scripts/ccat.zsh; fi
if (( ${+HAS_DIRENV} )); then . $ZDOTDIR/zprofile_scripts/direnv.zsh; fi
if (( ${+HAS_RBENV} )); then . $ZDOTDIR/zprofile_scripts/rbenv.zsh; fi
# ZSH Syntax Highlighting will only be enabled on login shells. Move to
# .zshrc if that becomes an issue
if (( ${+HAS_ZSH_SYNTAX_HIGHLIGHTING} )); then . $ZDOTDIR/zprofile_scripts/zsh_syntax_highlighting.zsh; fi

# enable C-s forward search
[[ $- == *i* ]] && stty -ixon

# enable up down history and place cursor at end of text
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# initialize comoletion system, caching for 20 hours Will only work on
# login shells. move to .zshrc if that ever becomes an issue
autoload -Uz compinit
comp_files=(${ZDOTDIR}/.zcompdump(Nm-20))
if (( $#comp_files )); then
    compinit -i -C
else
    compinit -i
fi
unset comp_files

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#####################################################################
# Source all files in .zprofile_local
# Scripts not in source-control. Machine-specific
#####################################################################
for f in $ZDOTDIR/.zprofile_local/*.sh; do
    . $f
done 2> /dev/null
