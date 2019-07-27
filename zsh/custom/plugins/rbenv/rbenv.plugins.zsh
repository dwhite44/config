# This plugin loads rbenv into the current shell and provides prompt info via
# the 'rbenv_prompt_info' function.

FOUND_RBENV=$+commands[rbenv]

if [[ $FOUND_RBENV -ne 1 ]]; then
    rbenvdirs=("$HOME/.rbenv" "/usr/local/rbenv" "/opt/rbenv" "/usr/local/opt/rbenv")
    for dir in $rbenvdirs; do
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_RBENV=1
            break
        fi
    done
fi

if [[ $FOUND_RBENV -ne 1 ]]; then
    if (( $+commands[brew] )) && dir=$(brew --prefix rbenv 2>/dev/null); then
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_RBENV=1
        fi
    fi
fi

if [[ $FOUND_RBENV -eq 1 ]]; then
    eval "$(rbenv init -)"
fi
