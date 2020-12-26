.PHONY: help clean clean-site clean-png png
help:
	@echo "\033[0;1mCommands\033[0m"
	@grep -E '^[.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[34;1m%-30s\033[0m %s\n", $$1, $$2}'
clean: clean-site clean-png

#
# SVG to PNG
#

clean-png:
	rm -rf build
	mkdir build
	mkdir build/landscapes
	mkdir build/logos
	mkdir build/quotes

LANDSCAPE_SVG := $(shell find landscapes -name '*.svg')
LANDSCAPE_PNG := $(addprefix build/,$(LANDSCAPE_SVG:%.svg=%.png))

LOGO_SVG := $(shell find logos -name '*.svg')
LOGO_PNG := $(addprefix build/,$(LOGO_SVG:%.svg=%.png))

QUOTE_SVG := $(shell find quotes -name '*.svg')
QUOTE_PNG := $(addprefix build/,$(QUOTE_SVG:%.svg=%.png))
QUOTE_NON_POST := build/quotes/quote-bkgd-post.png build/quotes/qeq-profile-pic-post.png
QUOTE_POST_PNG := $(filter-out $(QUOTE_NON_POST), $(addprefix build/,$(QUOTE_SVG:%.svg=%-post.png)))

png: $(LANDSCAPE_PNG) $(LOGO_PNG) $(QUOTE_PNG) $(QUOTE_POST_PNG) ## Convert all SVGs to PNGs

build/logos/%.png: logos/%.svg
	inkscape -o $@ -d 300 $<
build/landscapes/%.png: landscapes/%.svg
	inkscape -o $@ -d 96 $<
build/quotes/%.png: quotes/%.svg
	inkscape -o $@ -d 96 $<

# Quotes for an Instagram post are fitted to a square shape by placing them on a
# background.
build/quotes/%-post.png: build/quotes/%.png build/quotes/quote-bkgd.png
	# See https://imagemagick.org/script/composite.php
	composite -compose atop -geometry +610+190 $^ $@

#
# Site
#

clean-site:
	rm -rf site

site: clean-site ## Build website.
	mkdir site
	cp -r p5js site
	rm -rf site/p5js/template
