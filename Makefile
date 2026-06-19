BUILD_DIR := $(shell pwd)/build
$(shell mkdir -p $(BUILD_DIR))

XELATEX := $(shell which xelatex)
SRC := resume-awesome.tex
PDF := $(BUILD_DIR)/resume-awesome.pdf

.PHONY: all clean open

all: $(PDF)

$(PDF): $(SRC) sections/*.tex awesome-cv.cls
	@$(XELATEX) -output-directory $(BUILD_DIR) $(SRC)

clean:
	@rm -rf $(BUILD_DIR)

open: $(PDF)
	@open $(PDF)
