local ls = require("luasnip")
local i = ls.i;
local fmt = require("luasnip.extras.fmt").fmt

--stylua: ignore
return {
	ls.snippet('rustfmt', ls.text_node '#[rustfmt::skip]'),
	ls.snippet(
		{ trig = "atest", name = "async test", dscr = "Define an async test" },
		fmt([[
		#[tokio::test]
		async fn {}() {{
			{}
		}}
		]], {
			i(1, "test_name"),
			i(2, "")
		})
	)
}
