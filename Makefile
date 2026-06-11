XELATEX := /Library/TeX/texbin/xelatex
SRC := resume-awesome.tex
PDF := resume-awesome.pdf

.PHONY: all clean open

all: $(PDF)

$(PDF): $(SRC) sections/*.tex awesome-cv.cls
	@$(XELATEX) $(SRC)
	@$(XELATEX) $(SRC)

clean:
	@rm -f *.aux *.log *.out *.fls *.fdb_latexmk *.synctex.gz *.bbl *.blg

open: $(PDF)
	@open $(PDF)
