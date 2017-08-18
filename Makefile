BASEDIR=$(CURDIR)
INPUTDIR=source
OUTPUTDIR=output
TEMPLATEDIR=template

help:
	@echo 'Usage:                                       '
	@echo '   make pdf   generate a PDF file            '
	@echo '   make docx  generate a Microsoft Word file '

pdf:
	docker run --rm -v $(BASEDIR):/data cloudogu/pandoc \
	$(INPUTDIR)/*.md \
	-o "$(OUTPUTDIR)/document.pdf" \
	-H "$(TEMPLATEDIR)/preamble.tex" \
	--template="$(TEMPLATEDIR)/template.tex" \
	--verbose \
	2>pandoc.log \
	--listings \
	-V fontsize=12pt \
	-V documentclass:report \
	-N \
	--toc \
	--latex-engine=xelatex

docx:
	docker run --rm -v $(BASEDIR):/data cloudogu/pandoc \
	$(INPUTDIR)/*.md \
	-o "$(OUTPUTDIR)/document.docx" \
	--reference-docx="$(TEMPLATEDIR)/template.docx" \
	--verbose \
	2>pandoc.log \
	--toc \
	--listings

.PHONY: help pdf docx
