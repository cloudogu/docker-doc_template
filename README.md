![logo](resources/images/markdown-pdf.png)

# Cloudogu doc_template

[![](https://images.microbadger.com/badges/image/cloudogu/doc_template.svg)](https://hub.docker.com/r/cloudogu/doc_template/)
[![](https://images.microbadger.com/badges/version/cloudogu/doc_template.svg)](https://hub.docker.com/r/cloudogu/doc_template/)
## About this Repository

**Name:** cloudogu/doc_template

**Description** A docker container for generating a PDF with Cloudogu Corporate Design from markdown files.

## Requirements
-  Docker [https://www.docker.com/get-docker](https://www.docker.com/get-docker)

## Using the Container

1. Generate a PDF: `docker run -v $(pwd):/data cloudogu/doc_template <Template-Name> *.md` in a directory with Markdown files (Use [Panddoc Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown) syntax). The Template can be specified since version 0.22.0.

2. Result inside the project root: `document.pdf`

## Features

- Add a title page

Syntax:
```
% Testpage
% Cloudogu EcoSystem
```

Enhanced meta data format:
```
---
title:  'Testpage'
author:
- "Cloudogu GmbH"
version: '1.0'
date: '23.01.2021' 
...
```
 

- Syntax highlighting

- PlantUml

- Tables

- Long sequences

`\seqsplit{...abc...}`

See [sample.md](resources/sample/sample.md) for more information.

Or [sample.pdf](resources/sample/sample.pdf) for the converted pdf.

## Debugging

* Add `--verbose` before the file parameter, like so: `docker run -v $(pwd):/data cloudogu/doc_template --verbose *.md`
