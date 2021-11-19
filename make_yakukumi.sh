#!/bin/sh

mkdir -p fonts

for file in `find noto-cjk/ -name '*.ttc'`; do
    outname=`basename $file`
    outname=${outname/Noto/YakuKumi}
    outname=${outname/CJK/}
    outname=${outname/ttc/otf}
    pyftsubset ${file} --font-number=0 --text="、，。．〈〉《》「」『』【】〔〕（）［］｛｝" --layout-features='*' --output-file=fonts/${outname}
    familyname=${outname}
    familyname=${familyname/YakuKumiSans-/Yaku Kumi Sans }
    familyname=${familyname/.otf/}
    python3 fontname.py "${familyname}" fonts/${outname}
done
