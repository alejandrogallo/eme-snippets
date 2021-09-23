#!/usr/bin/env python3

import json
import os

outdir = "./dist"
out_ultisnips = os.path.join(outdir, "UltiSnips", "eme-snippets")
out_yas = os.path.join(outdir, "yas", "eme-snippets")

if __name__ == "__main__":
    infile = "snippets.json"
    data = []
    with open(infile) as f:
        data = json.load(f)
    for bundle in data:
        key = bundle["key"]
        for impl in bundle["bundle"]:
            lang = impl["language"]
            snippet = impl["snippet"]
            ultisnip = snippet["ultisnip"]
            yas = snippet["yas"]

            # ultisnips
            _dir = out_ultisnips
            _out = os.path.join(_dir, "{}.snippets".format(lang))
            os.makedirs(_dir, exist_ok=True)
            with open(_out, "w+") as f:
                f.write(ultisnip)

            # yas
            _dir = os.path.join(out_yas, "{}-mode".format(lang))
            _out = os.path.join(_dir, key)
            os.makedirs(_dir, exist_ok=True)
            with open(_out, "w+") as f:
                f.write(yas)
