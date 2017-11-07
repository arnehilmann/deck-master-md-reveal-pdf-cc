function CodeBlock(elem)
    if elem.classes[1] == "plantuml" then
        local filetype = "png"
        local mimetype = "image/png"

        local img = pandoc.pipe("java", {"-jar", "lib/plantuml.jar", "-tpng", "-p", "-Sbackgroundcolor=transparent"}, elem.text)
        local fname = "rendered/plantuml-" .. pandoc.sha1(img) .. "." .. filetype
        file = io.open(fname, "w")
        file:write(img)
        file:close()
        pandoc.mediabag.insert(fname, mimetype, img)
        return pandoc.Para{ pandoc.Image({pandoc.Str("rendered plantuml diagram")}, fname) }
    end
end
