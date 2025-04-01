#!/bin/sh

myname="${0##*/}"

# you can change this on config to the correct path on your system
nv_bin="/usr/bin/nvim"

pipe="/tmp/nvim.pipe"

config_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/nvim-wrap"
config_file="${config_dir}/configrc"

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
__HEREDOC__
fi

mypid="$$"

# make pipe dir
if [ ! -d "$pipe" ]; then
    mkdir -p "$pipe"
fi

pipe_file="${pipe}/${mypid}.pipe"

exec $nv_bin --listen "$pipe_file" "$@"
