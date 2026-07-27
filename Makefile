TEXBIN := /Library/TeX/texbin
export PATH := $(TEXBIN):$(PATH)

NAME := cv_4
BUILD := build
PDF := $(BUILD)/$(NAME).pdf

.PHONY: all clean

all: $(PDF)

$(PDF): $(NAME).tex resume.cls
	mkdir -p $(BUILD)
	pdflatex -interaction=nonstopmode -output-directory=$(BUILD) $(NAME).tex

clean:
	rm -rf $(BUILD)
