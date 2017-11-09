# cc-slides-master

from markdown including asciiart and asciinema, over pandoc, to revealjs html and pdf


## tl;dr

```
bin/scaffold ../new-shiny-slides
cd ../new-shiny-slides
# fumble slides.md
make
open index.html
```

## prerequisites

* make
* git
* curl
* pandoc >= 2.0
* docker
* jdk >=1.8 (when using asciiart renderer)
* asciinema (when using recorded terminal sessions)


## slides example

this ```slides.md``` here contains some example slides; they...
* have nice, cc-conform backgrounds (or animated gifs)
* use the cc font
* show embedded asciiart
* embed terminal session
* have cool transition effects
* render a pdf, ready for handout
```


## TODO

### possible formats for embedded ascii art

* http://www.umlet.com
* https://github.com/christiangoltz/shaape
* ~http://plantuml.com http://plantuml.com/PlantUML_Language_Reference_Guide.pdf~
* https://mermaidjs.github.io
* http://www.graphviz.org/content/dot-language
* https://github.com/BurntSushi/erd
* http://blockdiag.com/en/
* http://wavedrom.com
