#!/bin/sh

# UniteTTC is required.
# Please download it from http://yozvox.web.fc2.com/556E697465545443.html.

# expand ttc
for file in `find . -name '*.ttc'`; do
    ./unitettc64 ${file}
done

# mv Noto*CJK-*001.ttf Noto*CJKjp-*.otf
mkdir -p noto-cjk/otf
for file in `find . -name '*001.ttf'`; do
    fname=`basename $file`
    fbname=${fname%001.ttf}
    mv ${file} noto-cjk/otf/${fbname/-/jp-}.otf
done

# rm ttf
rm noto-cjk/ttc/*.ttf
