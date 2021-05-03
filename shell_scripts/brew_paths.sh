#echo "brew_paths.sh running..."

if [ $(arch) = "arm64" ]; then
    #echo "Adding Brew paths for arm64"

    eval $(/opt/homebrew/bin/brew shellenv);

    if [ -d "/opt/homebrew/opt/curl/bin" ] ; then
        export PATH="/opt/homebrew/opt/curl/bin:$PATH"
    fi

#    if [ -d "/opt/homebrew/opt/ruby/bin" ] ; then
#        export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
#    fi

    if [ -d "/opt/homebrew/opt/findutils/libexec/gnubin" ] ; then
        export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
    fi
else
    echo "Adding Brew paths for i386"

    #export PATH="/usr/local/opt:$PATH"

    #if [ -d "/usr/local/opt/ruby/bin" ] ; then
    #    export PATH="/usr/local/opt/ruby/bin:$PATH"
    #el

    if [ -d "/usr/local/opt/curl/bin" ] ; then
        export PATH="/usr/local/opt/curl/bin:$PATH"
    fi

    if [ -d "/usr/local/opt/findutils/libexec/gnubin" ] ; then
        export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
    fi
fi
