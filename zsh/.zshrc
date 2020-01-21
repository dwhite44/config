# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS='yyyy-mm-dd'
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

unsetopt global_rcs

# enable C-s forward search
[[ $- == *i* ]] && stty -ixon


# enable up down history and place cursor at end of text
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# initialize comoletion system, caching for 20 hours
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
# Setup Theme
#####################################################################
# set color to always so that output will not include color control characters
# when redirecting or piping
export CLICOLOR=1

# set auto so that it colors to tty but not when redirecting and piping
export GREP_OPTIONS='--color=auto'

precmd () {
    print -Pn "\e]2;%n | %~\a" # set title bar: username | pwd
    RPROMPT="%F{yellow}$(git_status) %F{green}|%n%F{blue}|%m|%F{white}%T"
}

setopt prompt_subst
PROMPT='
%(?.%F{cyan}√.%F{red}?%?) %F{green}%20<...<%~%<<%f $ '


#####################################################################
# Source all files in .zshrc_local
# Scripts not in source-control. Machine-specific
#####################################################################
for f in $ZDOTDIR/.zshrc_local/*.sh; do
    . $f
done 2> /dev/null
