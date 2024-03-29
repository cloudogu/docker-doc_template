![logo](resources/images/markdown-pdf.png)

# Cloudogu doc_template

[![](https://images.microbadger.com/badges/image/cloudogu/doc_template.svg)](https://hub.docker.com/r/cloudogu/doc_template/)
[![](https://images.microbadger.com/badges/version/cloudogu/doc_template.svg)](https://hub.docker.com/r/cloudogu/doc_template/)

## About this Repository

**Name:** cloudogu/doc_template

**Description** A docker container for generating a PDF with Cloudogu Corporate Design from markdown files.

## Requirements

- Docker [https://www.docker.com/get-docker](https://www.docker.com/get-docker)

## Using the Container

1. Build container with `docker build . -t cloudogu/doc_template`
2. 
   1. Navigate to a folder that contains markdown file(s)
   2. Generate a PDF: `docker run -v $(pwd):/data cloudogu/doc_template *.md <Template-Name>` in a directory with Markdown
      files (Use [Panddoc Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown) syntax). The Template can be specified
      since version 0.22.0. There are currently two templates `cloudogu` and `itz-bund`, the default template is `cloudogu`.
   3. The finished .pdf will reside in the current folder and is called `document.pdf`.

   Example:     
   > docker run -v $(pwd):/data cloudogu/doc_template Benutzerdoku_Projektvorlageagil.md itz-bund
3. Result inside the project root: `document.pdf`

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

## Release

Before release of this tool, update and release the submodules and update them here with `git submodule update --remote --merge`
(if you have trouble here, make sure the itz-bund sub-repo's branch is set to the prior released master branch).
After this just create a regular git-flow release in the docker-doc_template.

### Release on [Nexus registry](https://ecosystem.cloudogu.com/nexus/?ticket=ST-483-grh-sru8yBb5vuAwKCkW-EiS4Ww-cas#browse/browse:docker-registry:v2%2Fcloudogu)
Login `docker login ecosystem.cloudogu.com`, login via credentials from ecosystem.
`docker build -t ecosystem.cloudogu.com/cloudogu/markdown_doc_template:<version> .`

`docker push ecosystem.cloudogu.com/cloudogu/markdown_doc_template:<version>`

### Release in [Docker registry](https://hub.docker.com/repository/docker/cloudogu/doc_template)

`docker build -t cloudogu/doc_template:<version> .`

`docker push cloudogu/doc_template:<version>`