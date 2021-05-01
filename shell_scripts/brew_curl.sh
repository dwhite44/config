#echo "brew_curl.zsh running..."

# Make curl use homebrew version
if (( ${+HAS_ARM_CPU})) ; then
    curl() {
        /opt/homebrew/opt/curl/bin/curl "$@"
    }
else
    curl() {
        /usr/local/opt/curl/bin/curl "$@"
    }
fi
