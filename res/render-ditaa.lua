function CodeBlock(elem)
    if elem.classes[1] == "ditaa" then
        local filetype = "png"
        local mimetype = "image/png"

        local img = pandoc.pipe("java", {"-jar", "ditaa/service/web/lib/ditaa0_10.jar", "-", "-"}, elem.text)
        local fname = pandoc.sha1(img) .. "." .. filetype
        pandoc.mediabag.insert(fname, mimetype, img)
        return pandoc.Para{ pandoc.Image({pandoc.Str("rendered ditaa diagram")}, fname) }
    end
end
