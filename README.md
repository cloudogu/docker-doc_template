![logo](resources/images/markdown-pdf.png)
# Cloudogu doc_template
[![](https://images.microbadger.com/badges/image/cloudogu/doc_template.svg)](https://hub.docker.com/r/cloudogu/doc_template/)

## About this Repository
**Name:** cloudogu/doc_template

**Version** 0.16.0 | [Docker Hub](https://hub.docker.com/r/cloudogu/doc_template/tags/)

**Description** A docker container for generating a PDF with Cloudogu Corporate Design from markdown files.

**Size:** 7.31GB

## Requirements
-  Docker [https://www.docker.com/get-docker](https://www.docker.com/get-docker)

## Using the Container

1. Build container: `docker build -t cloudogu/doc_template .`

2. Generate a PDF: `docker run -v $(pwd):/data cloudogu/doc_template *.md` in a directory with Markdown files (Use [Panddoc Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown) syntax)

3. Result inside the project root: `document.pdf`


## Features

- Add a title page

`% Testpage
 % Cloudogu EcoSystem`


- Generate a PDF with PlantUml

`docker run --rm -e PLANTUML_SERVER=https://ecosystem.cloudogu.com -v $(pwd):/data -w /data cloudogu/doc-template:0.16 *.md
`

- Syntax highlighting

See [sample.md](resources/sample/sample.md) for more information.

Or [sample.pdf](resources/sample/sample.pdf) for the converted pdf.

## Using the convert.sh

the `convert.sh` automatically converts the ß. You can ignore the
*using special characters* section when converting with this script.

Possible options are:
`./convert.sh myDir/myMDFiles` to convert all markdown files
`./convert.sh myDir/myMDFiles sample.md` to convert a specific file

## Using special characters

Currently the ß must be encoded with `\"s`.
Otherwise it will be converted to SS.

Other special characters like Ä,Ö,Ü,€,@ are displayed correctly.
