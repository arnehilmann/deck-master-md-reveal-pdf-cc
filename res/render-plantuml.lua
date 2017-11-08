function CodeBlock(elem)
    if elem.classes[1] == "plantuml" then
        local filetype = "png"
        local mimetype = "image/png"
        local fname = "rendered/plantuml-" .. pandoc.sha1(elem.text) .. "." .. filetype

        local f=io.open(fname,"r")
        if f~=nil then
            io.close(f)
            io.stderr:write("cached plantuml rendering found!\n")
            return nil
        end

        io.stderr:write("rendering plantuml\n")
        local img = pandoc.pipe("java", {"-jar", "lib/plantuml.jar", "-tpng", "-p", "-Sbackgroundcolor=transparent"}, elem.text)
        f=io.open(fname, "w")
        f:write(img)
        f:close()
        pandoc.mediabag.insert(fname, mimetype, img)
        return pandoc.Para{ pandoc.Image({pandoc.Str("rendered plantuml diagram")}, fname) }
    end
end
