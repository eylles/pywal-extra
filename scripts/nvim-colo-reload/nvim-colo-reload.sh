#!/bin/sh

myname="${0##*/}"

nv_bin="/usr/bin/nvim"
pipe="/tmp/nvim.pipe"
colorscheme="pywal16"
statusbar=""

config_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/nvim-colo-reload"
config_file="${config_dir}/configrc"

nvim_send () {
    for pipe_instance in "${pipe}"/*.pipe; do
        $nv_bin --server "$pipe_instance" --remote-send ":${1}<CR>"
    done
}

rel_colo () {
    nvim_send "colorscheme ${colorscheme}"
}

rel_bar () {
    if [ -n "$statusbar" ]; then
        send_com=""
        case "$statusbar" in
            lualine)
                send_com="lua require'lualine'.setup{options={theme='${colorscheme}'}}"
                ;;
            airline)
                send_com="AirlineTheme ${colorscheme}"
                ;;
        esac
        nvim_send "$send_com<CR>"
    fi
}

rel_other () {
    :
}

# loading the config here means the user can overwrite any of the functions
if [ -f "$config_file" ]; then
    . "$config_file"
else
    if [ ! -d "$config_dir" ]; then
        mkdir -p "$config_dir"
    fi
    cat << __HEREDOC__ >> "$config_file"
# vim: ft=sh
# ${myname} config file

# neovim binary
nv_bin="${nv_bin}"

# pipe directory
pipe="${pipe}"

# colorscheme
colorscheme="${colorscheme}"

# statusbar
statusbar=""
__HEREDOC__
fi

rel_colo
rel_bar
rel_other
