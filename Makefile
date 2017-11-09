PROJECT_NAME = $(shell basename $(PWD))
DECKTAPE_CONTAINER=astefanutti/decktape:1.0.0
PDF_SIZE=1024x768
BASE_STYLE=simple

all:	$(PROJECT_NAME).pdf
	@echo
	@echo "FINISHED!"
	@echo
	@echo "open 'index.html'"
	@echo "open '$<'"
	@echo


%.pdf:	index.html lib/reveal.js
	docker run --rm -v `pwd`:/pwd -w /pwd \
		--env http_proxy=${http_proxy} --env https_proxy=${https_proxy} \
		$(DECKTAPE_CONTAINER) \
		reveal \
		--size $(PDF_SIZE) \
		$< $@


index.html:	slides.md lib/ pandoc-utils/ assets/ Makefile
	mkdir -p rendered
	pandoc \
		-f markdown \
		-t html5 \
		--template=pandoc-utils/template-revealjs.html \
		--standalone \
		--section-divs \
		--variable theme=$(BASE_STYLE) \
		--variable transition=slide \
		--variable title=$(PROJECT_NAME) \
		--lua-filter pandoc-utils/render-asciiart.lua \
		-o $@ \
		$<


lib: lib/reveal.js lib/ditaa.jar lib/plantuml.jar lib/asciinema


lib/reveal.js:
	mkdir -p lib
	git clone --depth 1 https://github.com/hakimel/reveal.js.git $@


lib/ditaa.jar:
	mkdir -p lib
	curl -L -o $@ https://github.com/stathissideris/ditaa/raw/master/service/web/lib/ditaa0_10.jar


lib/plantuml.jar:
	mkdir -p lib
	curl -L "https://sourceforge.net/projects/plantuml/files/plantuml.jar/download?use_mirror=10gbps-io" > $@


lib/asciinema:
	mkdir -p $@
	curl -L -o $@/asciinema-player.css https://github.com/asciinema/asciinema-player/releases/download/v2.5.0/asciinema-player.css
	curl -L -o $@/asciinema-player.js https://github.com/asciinema/asciinema-player/releases/download/v2.5.0/asciinema-player.js


start-chrome:
	open -a 'Google Chrome' --args -allow-file-access-from-files file://$(PWD)/index.html


clean:
	rm -rf index.html *.pdf rendered


mrproper:	clean
	rm -rf lib
	git clean -fxd


.PHONY: all clean mrproper start-chrome
