local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local f = ls.function_node
local t = ls.t
local i = ls.i
local c = ls.c
local d = ls.d
local fmt = require("luasnip.extras.fmt").fmt

-- A helper snippet to support an "endless" list of clone calls async
-- often done with a spawn call before the 'async move' block
local spawn_clones
spawn_clones = function()
  return sn(
    nil,
    c(1, {
      t(""),
      fmt([[
      let {} = {}.clone();
        {}
      ]], {
        i(1),
        f(function(values)
          local value = values[1][1]
          return '' .. value
        end, { 1 }),
        d(2, spawn_clones, {}),
      })
    })
  )
end

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
  s({ trig = "spawn", name = "tokio::spawn", descr = "Define a tokio spawn call" },
    fmt([[
    tokio::spawn({});
    ]], {
      c(1, {
        i(1),
        fmt([[{{
  {}
  async move {{
    {}
  }}
}}]], {
          d(1, spawn_clones, {}),
          i(2),
        }),
        fmt([[async move {{
  {}
}}]], {
          i(1),
        }),
      }),
    })
  ),
}
