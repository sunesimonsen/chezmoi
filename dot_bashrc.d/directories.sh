#!/usr/bin/env sh

alias ..='cd ..'

# z
if [ -f /usr/libexec/z.sh ]; then
    . /usr/libexec/z.sh
fi

if command -v rbenv &> /dev/null; then
    if [ -f "$(brew --prefix)/etc/profile.d/z.sh" ]; then
        . "$(brew --prefix)/etc/profile.d/z.sh"
    fi
fi
