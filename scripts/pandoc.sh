#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'

# copy all custom fonts from the selected into the system and install them
echo "Installing custom fonts..."
FONT_PATH="/usr/local/pandoc/template/${1:-cloudogu}/fonts"
mkdir -p ~/.local/share/fonts
cp "${FONT_PATH}"/*ttf ~/.local/share/fonts/
ls ~/.local/share/fonts/
fc-cache -f

#use --verbose to enable debugging output

echo "Starting pandoc.."
pandoc \
  --output=document.pdf \
  --template=/usr/local/pandoc/template/"${1:-cloudogu}"/template.tex \
  --include-in-header=/usr/local/pandoc/template/"${1:-cloudogu}"/preamble.tex \
  --listings \
  --highlight-style=pygments \
  --variable=fontsize:12pt \
  --variable=documentclass:scrreprt \
  --number-sections \
  --toc \
  --filter=pandoc-plantuml-filter \
  --latex-engine=xelatex \
  --verbose \
  "$2"

ls /usr/local/pandoc/template/itz-bund

if [ $? != 0 ]; then
    echo -e "${RED}Error: Could not convert files"
else
    echo -e "${GREEN}All files successfully converted"
fi

exit 0;