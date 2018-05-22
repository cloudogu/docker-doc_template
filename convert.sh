#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'

if [ $# -eq 0 ];then 
echo -e "No argument supplied. Please specify your markdown files \nE.g ./convert.sh myDir/myMDFiles or ./convert.sh myDir/myMDFiles sample.md"
exit 1;
fi

cd "$1"
if [ -z "$2" ];then
find . -type f -name "*.md" -print0 | xargs -0 sed -i 's/ß/\\"s/g'
docker run --rm -e PLANTUML_SERVER=https://ecosystem.cloudogu.com -v $(pwd):/data -w /data cloudogu/doc_template:latest *.md
find . -type f -name "*.md" -print0 | xargs -0 sed -i 's/\\"s/ß/g'
else
find . -type f -name "$2" -print0 | xargs -0 sed -i 's/ß/\\"s/g'
docker run --rm -e PLANTUML_SERVER=https://ecosystem.cloudogu.com -v $(pwd):/data -w /data cloudogu/doc_template:latest $2
find . -type f -name "$2" -print0 | xargs -0 sed -i 's/\\"s/ß/g'
fi 
cd -
if [ $? != 0 ];then
echo -e "${RED}Error: Could not convert files"
else
echo -e "${GREEN}All files successfully converted"
fi
exit 0;

