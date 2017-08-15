BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(INPUTDIR)/template

help:
	@echo 'Usage:                            '
	@echo '   make pdf   generate a PDF file '
	@echo '                                  '

pdf:
	docker run --rm -v $(BASEDIR):/data cloudogu/pandoc \
	$(INPUTDIR)/*.md \
	-o "$(OUTPUTDIR)/document.pdf" \
	-H "$(STYLEDIR)/preamble.tex" \
	--template="$(TEMPLATEDIR)/template.tex" \
	2>pandoc.log \
	--highlight-style pygments \
	-V fontsize=12pt \
	-V documentclass:report \
	-V lang:ngerman \
	-N \
	--toc \
	--self-contained \
	--latex-engine=xelatex

.PHONY: help pdf 
