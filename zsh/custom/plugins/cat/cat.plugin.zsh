cat() {
    if command -v ccat >/dev/null 2>/dev/null; then
        ccat "$@"
    else
        cat "$@"
    fi
}
