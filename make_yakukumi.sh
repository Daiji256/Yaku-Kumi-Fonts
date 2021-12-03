#!/bin/sh

mkdir -p fonts

for file in `find noto-cjk/ -name '*.ttc'`; do
    outname=`basename $file`
    outname=${outname/Noto/YakuKumi}
    outname=${outname/CJK/}
    outname=${outname/.ttc/}
    pyftsubset ${file} --font-number=0 --text-file=yakumono.txt --layout-features='*' --output-file=fonts/${outname}.otf
    familyname=${outname}
    familyname=${familyname/YakuKumiSans-/Yaku Kumi Sans }
    python3 fontname.py "${familyname}" fonts/${outname}.otf
    pyftsubset fonts/${outname}.otf --text-file=yakumono.txt --layout-features='*' --flavor=woff --output-file=fonts/${outname}.woff
    pyftsubset fonts/${outname}.otf --text-file=yakumono.txt --layout-features='*' --flavor=woff2 --output-file=fonts/${outname}.woff2
done
