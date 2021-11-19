#!/bin/sh

mkdir -p yaku-kumi

for file in `find noto-cjk/ -name '*.ttc'`; do
    outname=`basename $file`
    outname=${outname/Noto/YakuKumi}
    outname=${outname/CJK/}
    outname=${outname/ttc/otf}
    pyftsubset ${file} --font-number=0 --text-file=chars.txt --layout-features='*' --output-file=yaku-kumi/${outname}
done
