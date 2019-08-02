if [ -d "/usr/local/opt/ruby/bin" ] ; then
    export PATH="/usr/local/opt/ruby/bin:$PATH"
fi

if [ -d "/usr/local/opt/curl/bin" ] ; then
    export PATH="/usr/local/opt/curl/bin:$PATH"
fi

if [ -d "/usr/local/opt/findutils/libexec/gnubin" ] ; then
    export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
fi
