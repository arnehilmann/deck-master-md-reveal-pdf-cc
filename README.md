# cc-slides-master

from markdown including asciiart and asciinema, over pandoc, to revealjs html and pdf


## tl;dr

```
bin/scaffold ../new-shiny-slides
cd ../new-shiny-slides
make download-all-libs
# fumble slides.md
make
open index.html
```

## prerequisites

* make
* git
* pandoc >= 2.0
* docker
* curl
* bash
* jdk >=1.8 (when using asciiart renderer)
* asciinema (when using recorded terminal sessions)


## slides example

```slides.md``` contains some example slides; they...
* have nice, cc-conform backgrounds (or animated gifs)
* use the cc font
* show embedded asciiart
* embed terminal session
* have cool transition effects
* and a pdf, ready for handout
```


## asciiart renderer

If you want to use asciiart diagrams (for now, graphuml and ditaa are suppported),
you need a jdk1.8+ and the corresponding libs.
The later can be downloaded with
```
make download-all-libs
```


## trouble shooting

when ```make``` results in
```
Error running filter pandoc-utils/render-asciiart.lua:
Error while running filter function: Error running java (error code 1):
```,
you should install the asciiart renderer (see previous subsection).


## possible formats for embedded ascii art

* http://www.umlet.com
* https://github.com/christiangoltz/shaape
* http://plantuml.com http://plantuml.com/PlantUML_Language_Reference_Guide.pdf
* https://mermaidjs.github.io
* http://www.graphviz.org/content/dot-language
* https://github.com/BurntSushi/erd
* http://blockdiag.com/en/
* http://wavedrom.com
