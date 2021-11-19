#!/bin/sh

mkdir -p yaku-kumi

for file in `find noto-cjk/ttc/ -name '*.ttc'`; do
    fname=`basename $file`
    outname=${fname/Noto/YakuKumi}
    outname=${outname/CJKjp/}
    outname=${outname/ttc/otf}
    pyftsubset ${file} --font-number=0 --text-file=chars.txt --layout-features='*' --output-file=yaku-kumi/${outname}
done
