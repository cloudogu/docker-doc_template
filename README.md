# pandoc_example
A docker container for generating a PDF file from markdown files with Cloudogu Corporate Design.

## Quick start
1. Install [docker](https://www.docker.com/get-docker)
2. Build container with `docker build -t cloudogu/doc_template .`
3. To generate a PDF run `docker run -v $(pwd):/data cloudogu/doc_template *.md` in a directory with Markdown files (Use [Panddoc Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown) syntax)
4. Open the file `document.pdf` from the current directory

Have fun!

