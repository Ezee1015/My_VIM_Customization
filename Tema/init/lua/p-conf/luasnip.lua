local ls = require("luasnip")
local s = ls.s
local text = ls.text_node
local insert = ls.insert_node

-- Agrega la etiqueta "ul" que es subrayado en markdown
ls.add_snippets("markdown", {
	s("ul", {
		text("<ins>"),
		insert(1, "Texto Subrayado"),
		text("</ins> "),
		insert(0),
	})
})
ls.add_snippets("markdown", {
	s("center", {
		text({ '<div align="center">', "\t" }),
		insert(1),
		text({ "\t", "</div> " }),
		insert(0),
	})
})

-- Agrega el 'sout' en java (ya está el 'sysout' que hace lo mismo, pero 'sout' es más corto y me parece mejor)
ls.add_snippets("java", {
	s("sout", {
		text("System.out.println("),
		insert(1),
		text(");"),
		insert(0),
	})
})
