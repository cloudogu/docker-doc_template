#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'

pandoc -o $1 --template=/usr/local/pandoc/template/template.tex \
--include-in-header=/usr/local/pandoc/template/preamble.tex --listings \
--highlight-style=pygments --variable=fontsize:12pt \
--variable=documentclass:scrreprt --number-sections --toc \
--filter=pandoc-plantuml-filter --latex-engine=xelatex /data/*.md

if [ $? != 0 ]; then
echo -e "${RED}Error: Could not convert files"
else
echo -e "${GREEN}All files successfully converted"
fi

exit 0;