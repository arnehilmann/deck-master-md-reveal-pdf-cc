PROJECT_NAME = $(shell basename $(PWD))
DECKTAPE_CONTAINER=astefanutti/decktape:1.0.0
PDF_SIZE=1024x768
BASE_STYLE=simple

all:	$(PROJECT_NAME).pdf


%.pdf:	index.html lib/reveal.js
	docker run --rm -v `pwd`:/pwd -w /pwd \
		--env http_proxy=${http_proxy} --env https_proxy=${https_proxy} \
		$(DECKTAPE_CONTAINER) \
		reveal \
		--size $(PDF_SIZE) \
		$< $@


index.html:	slides.md lib/reveal.js res/ img/ css/ Makefile
	rm -rf rendered && mkdir -p rendered
	pandoc \
		-f markdown \
		-t html5 \
		--template=res/template-revealjs.html \
		--standalone \
		--section-divs \
		--variable theme=$(BASE_STYLE) \
		--variable transition=slide \
		--variable title=$(PROJECT_NAME) \
		--lua-filter res/render-ditaa.lua \
		--lua-filter res/render-plantuml.lua \
		-o $@ \
		$<

# -f markdown-pandoc_title_block \
# --self-contained \


lib/reveal.js:
	mkdir -p lib
	git clone https://github.com/hakimel/reveal.js.git $@


lib/ditaa:
	mkdir -p lib
	git clone https://github.com/stathissideris/ditaa.git $@


lib/plantuml.jar:
	curl -L "https://sourceforge.net/projects/plantuml/files/plantuml.jar/download?use_mirror=10gbps-io" > $@


lib/asciinema:
	mkdir -p $@
	curl -L -o $@/asciinema-player.css https://github.com/asciinema/asciinema-player/releases/download/v2.5.0/asciinema-player.css
	curl -L -o $@/asciinema-player.js https://github.com/asciinema/asciinema-player/releases/download/v2.5.0/asciinema-player.js


all-libs: lib/reveal.js lib/ditaa lib/plantuml.jar lib/asciinema


clean:
	rm -rf index.html *.pdf
