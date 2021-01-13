#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'

# set template
SELECTED_TEMPLATE=cloudogu
TEMPLATE_PATH_PREFIX="/usr/local/pandoc/template"
if [[ -z "${2:-cloudogu}" ]]; then
  echo "No template selected. Selecting default template: cloudogu"
else
  SELECTED_TEMPLATE=${2:-cloudogu}
  echo "Template ${SELECTED_TEMPLATE} selected..."
  # check whether a template with that name exists
  if [ ! -d "${TEMPLATE_PATH_PREFIX}/${SELECTED_TEMPLATE}/" ]; then
    echo "[Error] Template ${SELECTED_TEMPLATE} not found in templates folder!"
    exit 1
  fi
fi

# copy all custom fonts from the selected into the system and install them
echo "Installing custom fonts..."
FONT_PATH="/usr/local/pandoc/template/${SELECTED_TEMPLATE}/fonts"
if [ ! -z "$(ls -A ${FONT_PATH})" ]; then
  mkdir -p /usr/local/share/fonts/
  cp "${FONT_PATH}"/* /usr/local/share/fonts/
  fc-cache -f
fi

#use --verbose to enable debugging output
echo "Starting pandoc.."
pandoc \
  --output=document.pdf \
  --template=/usr/local/pandoc/template/"${SELECTED_TEMPLATE}"/template.tex \
  --include-in-header=/usr/local/pandoc/template/"${SELECTED_TEMPLATE}"/preamble.tex \
  --listings \
  --highlight-style=pygments \
  --variable=fontsize:12pt \
  --variable=documentclass:scrreprt \
  --number-sections \
  --toc \
  --filter=pandoc-plantuml-filter \
  --latex-engine=xelatex \
  "$1"

ls /usr/local/pandoc/template/itz-bund

if [[ $? != 0 ]]; then
    echo -e "${RED}Error: Could not convert files"
else
    echo -e "${GREEN}All files successfully converted"
fi

exit 0;