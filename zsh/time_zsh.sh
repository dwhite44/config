#!/usr/bin/env zsh
# Opens zshell 10 times giving time to load each time

export TIMEFMT='%U user %S system %P cpu %*E total'
echo "login shell:"
for i ({1..10}) time zsh -ilc echo &>/dev/null || true

echo "interactive shell:"
for i ({1..10}) time zsh -ic echo &>/dev/null || true
