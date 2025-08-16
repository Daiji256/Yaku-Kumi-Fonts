#!/bin/sh

mkdir -p fonts
mkdir -p tmp

wget https://github.com/notofonts/noto-cjk/raw/9241cec4a41a3832dfaaa75cd61d8f3be9c906fc/google-fonts/NotoSansJP%5Bwght%5D.ttf -O tmp/NotoSansJP-VF.ttf
wget https://github.com/notofonts/noto-cjk/raw/985fa52c81c1d6692ccdd82bc3656e8fb932fd89/google-fonts/NotoSerifJP%5Bwght%5D.ttf -O tmp/NotoSerifJP-VF.ttf

for w in 100 200 300 400 500 600 700 800 900; do
    fonttools varLib.instancer tmp/NotoSansJP-VF.ttf wght=${w} -o tmp/NotoSansJP-${w}.ttf
    fonttools subset tmp/NotoSansJP-${w}.ttf --text-file=yakumono.txt --name-IDs=0,7,8,9,10,11,13,14 --output-file=fonts/YakuKumiSans-${w}.ttf
    fonttools ttLib fonts/YakuKumiSans-${w}.ttf --flavor woff -o fonts/YakuKumiSans-${w}.woff
    fonttools ttLib fonts/YakuKumiSans-${w}.ttf --flavor woff2 -o fonts/YakuKumiSans-${w}.woff2
done

for w in 200 300 400 500 600 700 800 900; do
    fonttools varLib.instancer tmp/NotoSerifJP-VF.ttf wght=${w} -o tmp/NotoSerifJP-${w}.ttf
    fonttools subset tmp/NotoSerifJP-${w}.ttf --text-file=yakumono.txt --name-IDs=0,7,8,9,10,11,13,14 --output-file=fonts/YakuKumiSerif-${w}.ttf
    fonttools ttLib fonts/YakuKumiSerif-${w}.ttf --flavor woff -o fonts/YakuKumiSerif-${w}.woff
    fonttools ttLib fonts/YakuKumiSerif-${w}.ttf --flavor woff2 -o fonts/YakuKumiSerif-${w}.woff2
done
