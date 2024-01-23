local ls = require("luasnip")
local s = ls.snippet;
local t = ls.t;
local i = ls.i;
local c = ls.c;
local fmt = require("luasnip.extras.fmt").fmt

--stylua: ignore
return {
  s('rustfmt', t '#[rustfmt::skip]'),
  s({ trig = "test", name = "test", dscr = "Define a test" },
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
  ),
  s({ trig = "pstruct", name = "public struct", dscr = "Define a public struct" },
    fmt([[
      {}
      pub struct {} {{
          {}
      }}
    ]], {
      c(1, {
        t("#[derive(Debug)]"),
        t("#[derive(Debug, Deserialize, Serialize)]"),
      }),
      i(2, "struct name"),
      i(0, "")
    })
  ),
}
