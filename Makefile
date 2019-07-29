all: png
clean:
	rm -rf build
	mkdir build
	mkdir build/landscapes
	mkdir build/logos

LANDSCAPE_SVG := $(shell find landscapes -name '*.svg')
LANDSCAPE_PNG := $(addprefix build/,$(LANDSCAPE_SVG:%.svg=%.png))

LOGO_SVG := $(shell find logos -name '*.svg')
LOGO_PNG := $(addprefix build/,$(LOGO_SVG:%.svg=%.png))

png: $(LANDSCAPE_PNG) $(LOGO_PNG)

build/logos/%.png: logos/%.svg
	convert -density 300 -transparent white $< $@
build/landscapes/%.png: landscapes/%.svg
	convert -density 96 $< $@
