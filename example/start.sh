#!/bin/bash

font=$1

cp fonts/.font-spider/$font.ttf fonts/ 
sed "s/\$font/$font/g" index/index.html.base > index/index.html

fsp local index/index.html

# eot=$(cat fonts/$font.eot|base64|tr -d '\n')
# woff=$(cat fonts/$font.woff|base64|tr -d '\n')
woff2=$(cat fonts/$font.woff2|base64|tr -d '\n')
# ttf=$(cat fonts/$font.ttf|base64|tr -d '\n')
# svg=$(cat fonts/$font.svg|base64|tr -d '\n')

cat > fonts-zh.css <<EOF
@font-face {
    font-family: '$font';
    src: url(data:application/font-woff2;charset=utf-8;base64,$woff2) format('woff2');
    font-weight: normal;
    font-style: normal;
    font-display: swap;
}
EOF
