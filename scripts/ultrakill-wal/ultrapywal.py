from PIL import Image


def generate_color_images(colors, destdir):
    """Save palette colors as an image"""
    img = Image.new('RGB', (16, 1))
    for i, color in enumerate(colors['colors'].values()):
        img.paste(Image.new('RGB', (1, 1), color), (i, 0))
    img.save(os.path.join(destdir, 'colors.png'))


generate_color_images(colors, outdir)
