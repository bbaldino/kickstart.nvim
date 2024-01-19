local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

--stylua: ignore
return {
	ls.snippet('rustfmt', ls.text_node '#[rustfmt::skip]'),
	ls.snippet(
		{ trig = "atest", name = "async test", dscr = "Define an async test" },
		fmt("#[tokio::test]\nasync fn {} {{\n\t{}\n}}", {
			ls.insert_node(1, "foo"),
			ls.insert_node(2, "")
		})
	)
}
