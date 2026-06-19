XELATEX := $(shell which xelatex)
SRC := resume-awesome.tex
PDF := resume-awesome.pdf

BUILD_DIR := $(shell pwd)/build
$(shell mkdir -p $(BUILD_DIR))

.PHONY: all clean open

all: $(PDF)

$(PDF): $(SRC) sections/*.tex awesome-cv.cls
	@$(XELATEX) -output-directory $(BUILD_DIR) $(SRC)

clean:
	@rm -rf $(BUILD_DIR)

open: $(PDF)
	@open $(PDF)
