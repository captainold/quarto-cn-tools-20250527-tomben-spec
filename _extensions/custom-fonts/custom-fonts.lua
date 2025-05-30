function Span(span)
  if span.classes:includes("fangsong") or span.classes:includes("kaiti") or span.classes:includes("heiti") then
    if FORMAT == "docx" then
      local text = pandoc.utils.stringify(span.content)
      local fontName
      if span.classes:includes("fangsong") then
        fontName = "FZFangSong-Z02"
      elseif span.classes:includes("kaiti") then
        fontName = "FZKai-Z03"
      elseif span.classes:includes("heiti") then
        fontName = "FZHei-B01"  -- 方正黑体_GBK 的字体名（请确保 docx 模板或系统中有此字体）
      end
      local openxml = string.format(
        '<w:r><w:rPr><w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:eastAsia="%s" w:cs="Times New Roman" w:hint="eastAsia"/></w:rPr><w:t>%s</w:t></w:r>',
        fontName, text
      )
      return pandoc.RawInline("openxml", openxml)
    else
      -- For other formats, preserve the original span
      return span
    end
  end
end
