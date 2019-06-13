all: png
clean:
	rm -rf png
	mkdir png
	mkdir png/landscapes
	mkdir png/logos

LANDSCAPE_SVG := $(shell find landscapes -name '*.svg')
LANDSCAPE_PNG := $(addprefix png/,$(LANDSCAPE_SVG:%.svg=%.png))

LOGO_SVG := $(shell find logos -name '*.svg')
LOGO_PNG := $(addprefix png/,$(LOGO_SVG:%.svg=%.png))

png: $(LANDSCAPE_PNG) $(LOGO_PNG)

png/logos/%.png: logos/%.svg
	convert -density 300 -transparent white $< $@
png/landscapes/%.png: landscapes/%.svg
	convert -density 96 $< $@
