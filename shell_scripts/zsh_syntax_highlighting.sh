#echo "zsh_syntax_highlighting.zsh running..."

if (( ${+HAS_ARM_CPU})) ; then
    syntax_highlighting="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
    syntax_highlighting="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

fi
if [[ -f ${syntax_highlighting} ]]; then
    . "${syntax_highlighting}"
else
    echo "Missing zsh-syntax-highlighting, install with package manager (brew)"
fi
