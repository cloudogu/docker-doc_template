# pandoc_example
A simple example for generating a PDF file from markdown files with `cloudogu/pandoc_buildslave` container.

## Prerequisites
This example uses the docker container `cloudogu/pandoc`. You find instructions for the installation [here](https://github.com/cloudogu/pandoc-buildslave).

## Quick start
1. Install [docker](https://www.docker.com/get-docker)
2. Install container [cloudogu/pandoc](https://github.com/cloudogu/pandoc-buildslave)
3. Run `make pdf`
4. Open the file `document.pdf` from the directory `output`

## Play around
* Modify, delete or add markdown files (extension `*.md`) in the directory `source`
* Modify the LaTeX template in the directory `template`
* View all pandoc options with `docker run cloudogu/pandoc`

Have fun!

