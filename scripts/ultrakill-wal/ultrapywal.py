#!/usr/bin/env python3

import json
import os
import argparse

from PIL import Image


def generate_color_images(colors, destdir):
    """Save palette colors as an image"""
    img = Image.new('RGB', (16, 1))
    for i, color in enumerate(colors.values()):
        img.paste(Image.new('RGB', (1, 1), color), (i, 0))
    img.save(os.path.join(destdir, 'colors.png'))


# Initialize parser
parser = argparse.ArgumentParser()

# Adding optional argument
parser.add_argument("-f", "--file", help="JSON file to use")
parser.add_argument(
    "-o",
    "--output-dir",
    dest="targ",
    help="output directory for the palette image.",
)


# Read arguments from command line
args = parser.parse_args()

username = os.environ['USER']
base_cache_dir = os.environ.get('XDG_CACHE_HOME',
                                '/home/{}/.cache/'.format(username))
wal_cache_dir = base_cache_dir + '/wal'

if args.file:
    wal_cache_file = args.file
else:
    wal_cache_file = wal_cache_dir + '/colors.json'

if args.targ:
    output_dir = args.targ
else:
    output_dir = wal_cache_dir

with open(wal_cache_file) as json_file:
    data = json.load(json_file)


palette = {
    "color00": data["colors"]["color0"],
    "color01": data["colors"]["color1"],
    "color02": data["colors"]["color2"],
    "color03": data["colors"]["color3"],
    "color04": data["colors"]["color4"],
    "color05": data["colors"]["color5"],
    "color06": data["colors"]["color6"],
    "color07": data["colors"]["color7"],
    "color08": data["colors"]["color8"],
    "color09": data["colors"]["color9"],
    "color10": data["colors"]["color10"],
    "color11": data["colors"]["color11"],
    "color12": data["colors"]["color12"],
    "color13": data["colors"]["color13"],
    "color14": data["colors"]["color14"],
    "color15": data["colors"]["color15"],
}

generate_color_images(palette, output_dir)
