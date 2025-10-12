#!/usr/bin/env sh

if command -v asdf >/dev/null 2>&1
then
    export ASDF_GOLANG_MOD_VERSION_ENABLED=true
    . ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.bash
fi
