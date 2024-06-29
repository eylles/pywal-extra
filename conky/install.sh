#!/bin/sh

wal_config_dir="${HOME}/.config/wal/"
wal_template_dir="${HOME}/.config/wal/templates/"
# wal_cache_dir="${HOME}/.cache/wal/"

mkdir -p "$wal_config_dir"
mkdir -p "$wal_template_dir"

cp conkyrc          "${wal_config_dir}/conkyrc"
cp conky.conf       "${wal_config_dir}/conky.conf"
cp rings-v1.2.1.lua "${wal_config_dir}/rings-v1.2.1.lua"
cp conkycolors      "${wal_template_dir}/conkycolors"
