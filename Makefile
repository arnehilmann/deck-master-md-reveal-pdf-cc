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


index.html:	slides.md reveal.js ditaa res/ img/ css/ Makefile
	pandoc \
	    -t html5 \
	    -f markdown-pandoc_title_block \
	    --template=res/template-revealjs.html \
	    --self-contained \
	    --standalone \
	    --section-divs \
	    --variable theme=$(BASE_STYLE) \
	    --variable transition=slide \
	    --lua-filter res/render-ditaa.lua \
	    -o $@ \
	    $<


reveal.js:
	git clone https://github.com/hakimel/reveal.js.git


ditaa:
	git clone https://github.com/stathissideris/ditaa.git


clean:
	rm -rf index.html *.pdf
