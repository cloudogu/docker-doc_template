FROM cloudogu/pandoc
MAINTAINER Thomas Grosser <thomas.grosser@cloudogu.com>

RUN mkdir -p /usr/local/pandoc

# ADD ./template/preamble.tex /usr/local/pandoc/template/preamble.tex
# ADD ./template/template.tex /usr/local/pandoc/template/template.tex
COPY template /usr/local/pandoc/template/

WORKDIR /data

ENTRYPOINT ["pandoc", \
    "--output=document.pdf", \
	"--verbose", \
    "--template=/usr/local/pandoc/template/template.tex", \
    "--include-in-header=/usr/local/pandoc/template/preamble.tex", \
	"--listings", \
	"--variable=fontsize:12pt", \
	"--variable=documentclass:scrreprt", \
	"--number-sections", \
	"--toc", \
	"--latex-engine=xelatex"]

CMD ["--help"]