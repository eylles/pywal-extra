#!/usr/bin/env python3

def hex_to_rgb(color: str) -> tuple:
    """Convert a hex color to rgb."""
    return tuple(bytes.fromhex(color.strip("#")))


def rgb_to_hex(color: tuple) -> str:
    """Convert an rgb color to hex."""
    return "#%02x%02x%02x" % (*color,)


def darken_color(color: str, amount: int) -> str:
    """Darken a hex color."""
    ctup = hex_to_rgb(color)
    nctup = []
    for col in ctup:
        nctup.append(int(col * (1 - (amount/100))))
    return rgb_to_hex(nctup)


def lighten_color(color: str, amount: int) -> str:
    """Lighten a hex color."""
    ctup = hex_to_rgb(color)
    nctup = []
    for col in ctup:
        nctup.append(int(col + (255 - col) * (amount/100)))
    return rgb_to_hex(nctup)


def foxyfy(color, f):
    """pywalfox algorithm to lighten colors"""
    pwf = float(f)
    c = hex_to_rgb(color)
    b = [
        max(c[0], 10),
        max(c[1], 10),
        max(c[2], 10)
        ]
    b[0] = (min((max(0, int(b[0] + (b[0] * pwf)))), 255))
    b[1] = (min((max(0, int(b[1] + (b[1] * pwf)))), 255))
    b[2] = (min((max(0, int(b[2] + (b[2] * pwf)))), 255))
    return rgb_to_hex(b)


def blend_color(color: str, color2: str) -> str:
    """Blend two colors together."""
    r1, g1, b1 = hex_to_rgb(color)
    r2, g2, b2 = hex_to_rgb(color2)

    r3 = int(0.5 * r1 + 0.5 * r2)
    g3 = int(0.5 * g1 + 0.5 * g2)
    b3 = int(0.5 * b1 + 0.5 * b2)

    return rgb_to_hex((r3, g3, b3))
