PROJECT_NAME = $(shell basename $(PWD))
DECKTAPE_CONTAINER=astefanutti/decktape:1.0.0
PDF_SIZE=1024x768
BASE_STYLE=simple

all:	$(PROJECT_NAME).pdf


%.pdf:	index.html
	docker run --rm -v `pwd`:/pwd -w /pwd \
		--env http_proxy=${http_proxy} --env https_proxy=${https_proxy} \
		$(DECKTAPE_CONTAINER) \
		reveal \
		--size $(PDF_SIZE) \
		$< $@


index.html:	slides.md reveal.js res/ img/ css/ Makefile
	mkdir -p rendered
	pandoc \
		-t html5 \
		-f markdown-pandoc_title_block \
		--template=res/template-revealjs.html \
		--standalone \
		--section-divs \
		--variable theme=$(BASE_STYLE) \
		--variable transition=slide \
		--lua-filter res/render-ditaa.lua \
		--lua-filter res/render-plantuml.lua \
		-o $@ \
		$<

#--self-contained \


reveal.js:
	git clone https://github.com/hakimel/reveal.js.git


ditaa:
	git clone https://github.com/stathissideris/ditaa.git


plantuml.jar:
	curl -L "https://sourceforge.net/projects/plantuml/files/plantuml.jar/download?use_mirror=10gbps-io" > plantuml.jar


asciinema:
	mkdir -p asciinema
	curl -L -o asciinema/asciinema-player.css https://github.com/asciinema/asciinema-player/releases/download/v2.5.0/asciinema-player.css
	curl -L -o asciinema/asciinema-player.js https://github.com/asciinema/asciinema-player/releases/download/v2.5.0/asciinema-player.js


clean:
	rm -rf index.html *.pdf
