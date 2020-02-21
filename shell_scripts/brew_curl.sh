#echo "brew_curl.zsh running..."

# Make curl use homebrew version
curl() {
    /usr/local/opt/curl/bin/curl "$@"
}
