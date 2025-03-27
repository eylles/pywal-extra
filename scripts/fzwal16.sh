#!/bin/sh
# Lists dark themes by default.
# Light themes are listed if an argument is passed.
# Export FZWAL_RESET_CURSOR=1 if you don't want Pywal to change
# the default behaviour of the terminal cursor (inverse fg and bg).

cp -f ~/.cache/wal/colors.json /tmp/fzwal-backup.json

if [ -z "$FZWAL_COLORS" ]; then
    FZWAL_COLORS="--color=fg:15,bg:0,hl:10,fg+:15,bg+:8,hl+:12 \
    --color=info:10,prompt:13,pointer:12,marker:12,spinner:14,header:4 \
    --color=scrollbar:12"
fi

if [ -z "$FZWAL_OPTS" ]; then
    FZWAL_OPTS="--layout=reverse --height 100% --no-multi \
     --cycle --border sharp \
     --preview-window sharp \
     --prompt='filter: ' \
     --bind ctrl-g:last \
     --bind alt-g:first \
     --bind alt-k:preview-up \
     --bind alt-j:preview-down"
fi

config_dir="${XDG_CONFIG_HOME:-~/.config}/wal-choose"
config_file="${config_dir}/configrc"

colsmethod=darken

if [ -f "$config_file" ]; then
    . "$config_file"
fi

wal_args="--cols16 $colsmethod"

export FZF_DEFAULT_OPTS="${FZWAL_OPTS} ${FZWAL_COLORS}"

if [ -n "$1" ]; then
    IS_LIGHT=TRUE
    THEME=$(wal $wal_args --theme |
            sed '1,/Light Themes/d;/Extra/,$d' |
            sed -e '/^\S/d' -e 's/ - //' |
            fzf --preview="wal $wal_args -ql --theme {} && wal --preview")
else
    THEME=$(wal $wal_args --theme |
            sed '/Light Themes/,$d' |
            sed -e '/^\S/d' -e 's/ - //' |
            fzf --preview="wal $wal_args -q --theme {} && wal --preview")
fi


if [ -n "$THEME" ]; then
    if [ -n "$IS_LIGHT" ]; then
        wal -ql --theme $THEME
    else
        wal -q --theme $THEME
    fi
else
    wal -q --theme /tmp/fzwal-backup.json
fi

if [ -n "$FZWAL_RESET_CURSOR" ]; then
    for TTY in /dev/pts/*; do
        [ -w $TTY ] && /bin/printf "\e]112\a" > $TTY
    done
    exit 0
fi
