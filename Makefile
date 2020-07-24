all: png
clean:
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

png: $(LANDSCAPE_PNG) $(LOGO_PNG) $(QUOTE_PNG)

build/logos/%.png: logos/%.svg
	inkscape -o $@ -d 300 $<
build/landscapes/%.png: landscapes/%.svg
	inkscape -o $@ -d 96 $<
build/quotes/%.png: quotes/%.svg
	inkscape -o $@ -d 96 $<
