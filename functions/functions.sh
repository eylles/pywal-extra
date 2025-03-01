#!/bin/sh

# posix shell compliant functions that are useful
# inside scripts

# just source them


# return type: hexrgb string
# usage: foxyfy "hex color" "factor"
# description:
#   pywalfox algorithm to lighten
#   a color without destroying saturation
foxyfy() {
    python3 - "$@" <<'___HEREDOC'
from sys import argv


def hex_to_rgb(color):
    """Convert a hex color to rgb."""
    return tuple(bytes.fromhex(color.strip("#")))


def rgb_to_hex(color):
    """Convert an rgb color to hex."""
    return "#%02x%02x%02x" % (*color,)


def work(color, f):
    pwf = float(f)
    c = hex_to_rgb(color)
    b = []
    b.append(min((max(0, int(c[0] + (c[0] * pwf)))), 255))
    b.append(min((max(0, int(c[1] + (c[1] * pwf)))), 255))
    b.append(min((max(0, int(c[2] + (c[2] * pwf)))), 255))
    return rgb_to_hex(b)


print(work(argv[1],argv[2]))
___HEREDOC
}

# return type: comma delimited list string
# usage: hexToRgb "#abc123"
# description:
#   Converts hex colors into rgb list joined with comma
#   #ffffff -> 255,255,255
hexToRgb() {
    # Remove '#' character from hex color #fff -> fff
    plain=${1#*#}
    # printf '%s\n' "$plain"
    seg1="${plain%%[A-Fa-f0-9][A-Fa-f0-9][A-Fa-f0-9][A-Fa-f0-9]}"
    # printf '%s\n' "$seg1"
    seg2="${plain}"
    seg2="${seg2%%[A-Fa-f0-9][A-Fa-f0-9]}"
    seg2="${seg2##[A-Fa-f0-9][A-Fa-f0-9]}"
    # printf '%s\n' "$seg2"
    seg3="${plain##[A-Fa-f0-9][A-Fa-f0-9][A-Fa-f0-9][A-Fa-f0-9]}"
    # printf '%s\n' "$seg3"
    printf '%d,%d,%d\n' 0x"${seg1}" 0x"${seg2}" 0x"${seg3}"
  }

# return type: string
# usage: split_list "string" "pattern"
# description:
#   splits list string on pattern returns
#   a newline separated list.
# taken from: https://github.com/dylanaraps/pure-sh-bible#split-a-string-on-a-delimiter
split_list() {
    # Disable globbing.
    # This ensures that the word-splitting is safe.
    set -f

    # Store the current value of 'IFS' so we
    # can restore it later.
    old_ifs=$IFS

    # Change the field separator to what we're
    # splitting on.
    IFS=$2

    # Create an argument list splitting at each
    # occurance of '$2'.
    #
    # This is safe to disable as it just warns against
    # word-splitting which is the behavior we expect.
    # shellcheck disable=2086
    set -- $1

    # Print each list value on its own line.
    printf '%s\n' "$@"

    # Restore the value of 'IFS'.
    IFS=$old_ifs

    # Re-enable globbing.
    set +f
}

# return type: hexrgb string
# usage: lighten "hexrgb color" "percentage int"
lighten () {
    color=$1
    amount=$2
    rgbcol=$(hexToRgb "$color")
    colout=""
    i=0
    if [ -n ${ZSH_VERSION-} ]; then
        setopt sh_word_split
    fi
    for colbit in $(split_list "$rgbcol" ","); do
        modbit=$(( colbit + ( 255 * amount / 100 ) ))
        # printf '%s: %d\n' "$i" "$modbit"
        # printf '%s: %02x\n' "$i" "$modbit"
        colout="${colout}"$(printf '%02x' "$modbit")
        i=$(( i + 1))
    done
    printf '#%s\n' "$colout"
    if [ -n ${ZSH_VERSION-} ]; then
        unsetopt sh_word_split
    fi
}

# return type: hexrgb string
# usage: darken "hexrgb color" "percentage int"
darken () {
    color=$1
    amount=$2
    rgbcol=$(hexToRgb "$color")
    colout=""
    i=0
    if [ -n ${ZSH_VERSION-} ]; then
        setopt sh_word_split
    fi
    for colbit in $(split_list "$rgbcol" ","); do
        modbit=$(( colbit - ( 255 * amount / 100 ) ))
        # printf '%s: %d\n'   "$i" "$modbit"
        # printf '%s: %02x\n' "$i" "$modbit"
        colout="${colout}"$(printf '%02x' "$modbit")
        i=$(( i + 1))
    done
    printf '#%s\n' "$colout"
    if [ -n ${ZSH_VERSION-} ]; then
        unsetopt sh_word_split
    fi
}

