#!/usr/bin/env python3
"""Recreate the four original-source image crops recorded in assets_ch11.json."""
from pathlib import Path
import json
import fitz
from PIL import Image
R = Path(__file__).resolve().parents[1]
with fitz.open(R / "source/original.pdf") as source:
    for entry in json.loads((R / "source/assets_ch11.json").read_text()):
        page = source[entry["source_pdf_page"] - 1]
        scale = entry["render_dimensions"][0] / page.rect.width
        pix = page.get_pixmap(matrix=fitz.Matrix(scale, scale))
        im = Image.frombytes("RGB", (pix.width, pix.height), pix.samples)
        im.crop(tuple(entry["crop_render_pixels"])).save(R / entry["file"])
