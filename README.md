# Quarto 专报写作模板

[![发布](https://github.com/TomBener/quarto-cn-tools/actions/workflows/quarto-publish.yml/badge.svg)](https://github.com/TomBener/quarto-cn-tools/actions/workflows/quarto-publish.yml)

此仓库提供了一套全面的指南和工具集，用于中文学术论文的写作，包括中文引用和参考文献的本地化和排序、中文引号的转换以及中英文字符间空格的校正。借助这些模板和脚本，您可以在 Markdown 中撰写学术论文，并通过 Quarto 将其转换为多种格式，如 Word、HTML、LaTeX、PDF 和 EPUB。

主要用于中咨公司气候处撰写专报。 

## 新版本说明

在这个新版本中，我们对工具集进行了优化，提升了中文文献处理的准确性和效率。此外，增加了对更多格式的支持，并改进了用户界面，使得使用体验更加流畅。

## 功能

- **多格式渲染**：使用相同的源文件同时渲染 DOCX、HTML、PDF、EPUB 和 Reveal.js 幻灯片，PDF 可定制为打印版或带水印。
- **本地化中文参考文献**：将引用和参考文献中的 `et al.` 等英文本地化字符串更改为中文，支持作者-日期和数字样式。
- **排序中文参考文献**：按拼音排序中文参考文献，并可自定义中文条目排序在前或在后。
- **校正中文引号**：调整中文引号以实现复杂的排版。
- **校正空格**：改进文案，校正 CJK 之间的空格、单词和标点。
- **提取参考文献**：将文档中引用的所有参考文献提取为 BibTeX/BibLaTeX 文件，并将引用的参考文件复制到指定目录。
- **生成反向链接**：为参考文献条目生成到相应引用的反向链接。
- **移除 DOI 超链接**：如果不需要在参考文献中显示 DOI 超链接，则移除由 `citeproc` 格式化的 DOI 超链接。

## 先决条件

- [Quarto](https://quarto.org)，包含 [Pandoc](https://pandoc.org)，您可以通过 `quarto install tinytex --update-path` 安装 TinyTeX。
- Python 及以下软件包：
  - [autocorrect_py](https://github.com/huacnlee/autocorrect/tree/main/autocorrect-py)
  - [pypinyin](https://github.com/mozillazg/python-pinyin)
  - [panflute](https://github.com/sergiocorreia/panflute)
- R 及以下软件包：
  - [rmarkdown](https://github.com/rstudio/rmarkdown)
  - [knitr](https://github.com/yihui/knitr)
  - [ggplot2](https://github.com/tidyverse/ggplot2)

## 使用方法

> [!注意]
> 目前 [Lua 过滤器](https://github.com/quarto-dev/quarto-cli/issues/7888) 无法在 Quarto 中在 `citeproc` 之后运行。作为一种解决方法，一些扩展在 Makefile 中通过命令行运行。这可以在[未来](https://github.com/quarto-dev/quarto-cli/milestone/15)得到改进。

本项目使用 [Makefile](Makefile) 来管理构建过程。以下是可用的命令：

- `make` 或 `make all`：同时渲染 DOCX、HTML、PDF、EPUB 和 Reveal.js 幻灯片。
- `make docx`：渲染 DOCX。
- `make html`：渲染 HTML。
- `make pdf`：渲染 PDF。
- `make epub`：渲染 EPUB。
- `make slides`：渲染 Reveal.js 幻灯片。
- `make print`：渲染用于打印的 PDF。
- `make watermark`：渲染带水印的 PDF。
- `make citebib`：提取所有引用的参考文献为 BibLaTeX 文件 `citebib.bib`。
- `make citedoc`：将引用的参考文件复制到指定目录。
- `make clean`：删除辅助和输出文件。

## 工具

> [!提示]
> 这些工具也可以单独用于您的 Pandoc 或 Quarto 项目中。

- [auto-correct](_extensions/auto-correct.py)：使用 AutoCorrect 改进文案，校正 CJK 和英文之间的空格、单词和标点。
- [citation-backlinks](_extensions/citation-backlinks.lua)：为参考文献条目生成到相应引用的反向链接。
- [citation-tools](_extensions/citation-tools.py)：从 Markdown 文件中提取引用键，并将引用的参考文件复制到指定目录。
- [confetti](_extensions/confetti/)：在 Reveal.js 幻灯片中发送一些 🎊。
- [cnbib-quotes](_extensions/cnbib-quotes.lua)：处理 HTML 和 EPUB 输出中的中文参考文献引号。
- [docx-quotes](_extensions/docx-quotes/)：在 DOCX 中将直角引号转换为弯引号。
- [format-md](_extensions/format-md.py)：预处理 Markdown 文件以便使用 Quarto 转换。
- [get-bib](_extensions/get-bib.lua)：提取文档中引用的所有参考文献为 BibLaTeX 文件。[注释^bib]
- [ignore-softbreaks](_extensions/ignore-softbreaks/)：在 Quarto 中模拟 Pandoc 的扩展 `east_asian_line_breaks` [链接](https://github.com/quarto-dev/quarto-cli/issues/8520)。
- [latex-quotes](_extensions/latex-quotes/)：在 LaTeX 输出中将直角引号替换为德语引号，并对标题进行特定处理以避免 PDF 书签中的问题。
- [links-to-citations](_extensions/links-to-citations/)：移除本地链接，但保留链接文本作为普通引用。
- [localize-cnbib](_extensions/localize-cnbib.lua)：本地化中文参考文献，将 `et al.` 和其他英文本地化字符串更改为中文。
- [remove-doi-hyperlinks](_extensions/remove-doi-hyperlinks.lua)：移除由 `citeproc` 格式化的 [DOI 超链接](https://github.com/jgm/pandoc/issues/10393)。默认情况下禁用。要启用它，请将 `-L _extensions/remove-doi-hyperlinks.lua` 添加到 Makefile 中的 `FILTERS` 变量，并在 CSL 文件中移除 `<text variable="DOI" prefix="DOI: "/>`。
- [remove-spaces](_extensions/remove-spaces/)：在 DOCX 中移除中文字符前后的空格。
- [sort-cnbib](_extensions/sort-cnbib.py)：按拼音排序中文参考文献，并可自定义中文条目排序在前或在后。

## 许可证

本项目根据 MIT 许可证授权，详情请参阅 [LICENSE](LICENSE) 文件。

[^bib]: `get-bib` 工具基于 Pandoc，为了更好和更灵活的实现，请使用 `citation-tools`。
