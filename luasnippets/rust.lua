local ls = require("luasnip")
local t = ls.t;
local i = ls.i;
local c = ls.c;
local fmt = require("luasnip.extras.fmt").fmt

--stylua: ignore
return {
	ls.snippet('rustfmt', ls.text_node '#[rustfmt::skip]'),
	ls.snippet(
		{ trig = "atest", name = "async test", dscr = "Define an async test" },
		fmt([[
		{} {}() {{
			{}
		}}
		]], {
			c(1, {
				t({ "#[tokio::test]", "async fn" }),
				t({ "#[test]", "fn" }),
			}),
			i(2, "test_name"),
			i(3, "")
		})
	)
}
