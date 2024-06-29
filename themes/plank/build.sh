#!/bin/sh

mkdir -p "${HOME}"/.local/share/plank/themes/wal/

sed '8,15 s/,/;;/g' "${HOME}"/.cache/wal/dock.theme > "${HOME}"/.local/share/plank/themes/wal/dock.theme

