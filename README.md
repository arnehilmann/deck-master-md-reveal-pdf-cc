# deck-master-md-reveal-pdf-cc

from markdown (including asciiart and asciinema),
over pandoc and custom rendering,
to revealjs html and pdf

example: [markdown](https://raw.githubusercontent.com/arnehilmann/deck-master-md-reveal-pdf-cc/master/slides.md)
-> [pdf](example/deck-master-md-reveal-pdf-cc.pdf)


## tl;dr

```
# all prerequisites checked

bin/scaffold ../new-shiny-slides
cd ../new-shiny-slides
# edit slides.md
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


## features

* write slides in markdown
* embed asciiart directly
* whole process automated
* nice, cc-conform backgrounds (or animated gifs)
* embed terminal session
* cool transition effects (thanks to reveal.js)
* render handout as pdf


## ascii renderer

at the moment, ```ditaa``` and ```graphuml``` asciiart is supported (see
[example slides.md](https://raw.githubusercontent.com/arnehilmann/deck-master-md-reveal-pdf-cc/master/slides.md)
).


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
