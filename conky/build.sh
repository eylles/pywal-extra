#!/bin/sh

# colors from pywal

. "${HOME}/.cache/wal/colors.sh"

cat "${HOME}/.config/wal/conkyrc" "${HOME}/.cache/wal/conkycolors" "${HOME}/.config/wal/conky.conf" > "${HOME}/.config/conky/conkyrc"
sed "s/000000/${color0###}/g ; s/B33F41/${color5###}/g" "${HOME}/.config/wal/rings-v1.2.1.lua" > "${HOME}/.config/conky/rings-v1.2.1.lua"

