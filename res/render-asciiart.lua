function CodeBlock(elem)
    if elem.classes[1] == "ditaa" then
        local filetype = "png"
        local mimetype = "image/png"
        local fname = "rendered/ditaa-" .. pandoc.sha1(elem.text) .. "." .. filetype

        local f=io.open(fname,"r")
        if f~=nil then
            io.close(f)
            io.stderr:write("cached ditaa rendering found!\n")
            return nil
        end

        io.stderr:write("rendering ditaa\n")
        local img = pandoc.pipe("java", {"-jar", "lib/ditaa/service/web/lib/ditaa0_10.jar", "-", "-"}, elem.text)
        local f=io.open(fname, "w")
        f:write(img)
        f:close()
        pandoc.mediabag.insert(fname, mimetype, img)
        return pandoc.Para{ pandoc.Image({pandoc.Str("rendered ditaa diagram")}, fname) }
    end
end
