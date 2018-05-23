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

2. Generate a PDF: `docker run -v $(pwd):/data cloudogu/doc_template filename.pdf` in a directory with Markdown files (Use [Panddoc Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown) syntax)

3. Result inside the project root: `filename.pdf`

## Features

- Add a title page

`% Testpage
 % Cloudogu EcoSystem`

- Syntax highlighting

- PlantUml

- Tables

See [sample.md](resources/sample/sample.md) for more information.

Or [sample.pdf](resources/sample/sample.pdf) for the converted pdf.

