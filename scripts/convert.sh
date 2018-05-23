#!/bin/bash
if [ -z "$1" ];then
document_name="document.pdf"
else
document_name="$1"
fi
# search and replace ß because
find . -type f -name "*.md" -print0 | xargs -0 sed -i 's/ß/\\"s/g'
/usr/local/bin/pandoc.sh $document_name
find . -type f -name "*.md" -print0 | xargs -0 sed -i 's/\\"s/ß/g'

exit 0;

