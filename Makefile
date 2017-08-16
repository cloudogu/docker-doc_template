BASEDIR=$(CURDIR)
INPUTDIR=source
OUTPUTDIR=output
TEMPLATEDIR=template

help:
	@echo 'Usage:                            '
	@echo '   make pdf   generate a PDF file '
	@echo '                                  '

pdf:
	docker run --rm -v $(BASEDIR):/data cloudogu/pandoc \
	$(INPUTDIR)/*.md \
	-o "$(OUTPUTDIR)/document.pdf" \
	-H "$(TEMPLATEDIR)/preamble.tex" \
	--template="$(TEMPLATEDIR)/template.tex" \
	2>pandoc.log \
	--highlight-style pygments \
	-V fontsize=12pt \
	-V documentclass:report \
	-N \
	--toc \
	--self-contained \
	--filter pandoc-plantuml-filter \
	--latex-engine=xelatex

.PHONY: help pdf 
