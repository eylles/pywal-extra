#!/bin/bash

. "${HOME}/.cache/wal/colors.sh"

conffile="$HOME/.config/niri/config.kdl"

declare -A colors
colors=(
    ["background-color"]="${background}"
    ["active-color"]="$color11"
    ["inactive-color"]="$color3"
)

for key in "${!colors[@]}"; do
    new_color=${colors[$key]}
    sed -i "s|$key \"[^\"]*\"|$key \"$new_color\"|g" $conffile
done
