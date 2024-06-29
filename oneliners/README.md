# one liners

some assorted one liners that can be used in shell scripts to theme software with colors from pywal.

flameshot:
```sh
sed -i "
/uiColor/s/\#[[:xdigit:]]\{6\}/$color12/ ;
/UiColo/s/\#[[:xdigit:]]\{6\}/$color8/ ;
/drawColor/s/\#[[:xdigit:]]\{6\}/$color10/
" ~/.config/flameshot/flameshot.ini
```

mpv background color:
```sh
sed -i '/background/s@#[[:xdigit:]]\{6\}@'"$color0"'@' ~/.config/mpv/mpv.conf
```

colors for the [tethys](https://github.com/Zren/mpv-osc-tethys) osc
```sh
sed -i '/buttonHoveredColor/s@#[[:xdigit:]]\{6\}@'"$color11"'@ ; /seekbarFgColor/s@#[[:xdigit:]]\{6\}@'"$color2"'@' ~/.config/mpv/script-opts/tethys.conf
```
