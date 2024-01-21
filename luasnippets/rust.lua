local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

--stylua: ignore
return {
	ls.snippet('rustfmt', ls.text_node '#[rustfmt::skip]'),
	ls.snippet(
		{ trig = "atest", name = "async test", dscr = "Define an async test" },
		fmt([[
		#[tokio::test]
		async fn {} {{
			{}
		}}
		]], {
			ls.insert_node(1, "test_name"),
			ls.insert_node(2, "")
		})
	)
}
