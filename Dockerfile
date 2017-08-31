FROM cloudogu/pandoc:0.7.0
MAINTAINER Thomas Grosser <thomas.grosser@cloudogu.com>

RUN mkdir -p /usr/local/pandoc

COPY template /usr/local/pandoc/template/

WORKDIR /data

ENTRYPOINT ["pandoc", \
    "--output=document.pdf", \
	"--verbose", \
    "--template=/usr/local/pandoc/template/template.tex", \
    "--include-in-header=/usr/local/pandoc/template/preamble.tex", \
	"--listings", \
	"--highlight-style pygments", \
	"--variable=fontsize:12pt", \
	"--variable=documentclass:scrreprt", \
	"--number-sections", \
	"--toc", \
	"--filter=pandoc-plantuml-filter", \
	"--latex-engine=xelatex"]

CMD ["--help"]