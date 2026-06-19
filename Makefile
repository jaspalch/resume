BUILD_DIR := build
SITE_DIR := public
SRC := resume-awesome.tex
NAME := jaspal-chauhan-resume
PDF := $(BUILD_DIR)/$(NAME).pdf

$(shell mkdir -p $(BUILD_DIR) $(SITE_DIR))

ifeq ($(GITHUB_ACTIONS),)
DOCKER_RUN := docker run --rm -v $(shell pwd):/resume -w /resume texlive/texlive
else
DOCKER_RUN :=
endif

.PHONY: all site clean open

all: $(PDF) site

site: $(PDF)
	@cp $(PDF) $(SITE_DIR)/$(NAME).pdf
	@echo '<meta http-equiv="refresh" content="0; url=$(NAME).pdf">' > $(SITE_DIR)/index.html

open: $(PDF)
	@open $(PDF)
	 
$(PDF): $(SRC) sections/*.tex awesome-cv.cls
	@$(DOCKER_RUN) xelatex -output-directory $(BUILD_DIR) -jobname $(NAME) $(SRC)

clean:
	@rm -rf $(BUILD_DIR) $(SITE_DIR)
