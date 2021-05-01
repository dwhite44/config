# This plugin loads rbenv into the current shell and provides prompt info via
# the 'rbenv_prompt_info' function.

#echo "rbenv.sh running..."

FOUND_RBENV=$+commands[rbenv]

if [[ $FOUND_RBENV -ne 1 ]]; then
    rbenvdirs=("$HOME/.rbenv" "/usr/local/rbenv" "/opt/rbenv" "/usr/local/opt/rbenv" "/opt/homebrew/opt/rbenv")
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
    #echo "Found rbenv. Initing rbenv..."
    eval "$(rbenv init -)"

    # IF using Homebrew, configure to use homebrew's openssl so that it doesn't
    # install a new version on each ruby install. Will not work for ruby versions
    # less than 2.4.0
    if (( ${+HAS_BREW} )); then
        #echo "Configuring rbenv to use homebrew openssl"
        export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
    fi
fi
