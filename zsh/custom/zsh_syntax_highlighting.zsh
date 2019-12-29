syntax_highlighting="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [[ -f ${syntax_highlighting} ]]; then
    . "${syntax_highlighting}"
else
    echo "Missing zsh-syntax-highlighting, install with package manager (brew)"
fi
