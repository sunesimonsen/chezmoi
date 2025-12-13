#!/usr/bin/env sh

if command -v asdf >/dev/null 2>&1
then
    export ASDF_GOLANG_MOD_VERSION_ENABLED=true
    if [ -d ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang ]
    then
        . ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.bash
        export PATH="$GOBIN:$PATH"
    fi
fi
