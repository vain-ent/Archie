#!/usr/bin/env bash
for cmd in "$@"; do
    eval "command -v ${cmd%% *}" >/dev/null 2>&1 || continue

    if [[ "$cmd" == brave* ]]; then
        eval "$cmd --enable-features=UseOzonePlatform --ozone-platform=wayland" &
    else
        eval "$cmd" &
    fi

    exit
done
exit 1

