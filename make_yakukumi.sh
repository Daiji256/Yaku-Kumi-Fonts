#!/bin/sh

mkdir -p yaku-kumi

for file in `find noto-cjk/otf/ -name '*.otf'`; do
    fname=`basename $file`
    outname=${fname/Noto/YakuKumi}
    outname=${outname/CJKjp/}
    pyftsubset ${file} --text-file=chars.txt --layout-features='*' --output-file=yaku-kumi/${outname}
done
