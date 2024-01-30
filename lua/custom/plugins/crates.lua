return {
  'saecki/crates.nvim',
  event = { "BufRead Cargo.toml" },
  keys = {
    {
      "<leader>ce",
      function()
        vim.cmd("Crates expand_plain_crate_to_inline_table")
      end,
      desc = "Expand plain crate dependency to table"
    },
    {
      "<leader>cv",
      function()
        vim.cmd("Crates show_versions_popup")
      end,
      desc = "Show crate versions"
    },
    {
      "<leader>cf",
      function()
        vim.cmd("Crates show_features_popup")
      end,
      desc = "Show crate features"
    }
  },
  config = function()
    require('crates').setup {
      popup = {
        autofocus = true
      },
      src = {
        cmp = {
          enabled = true
        }
      }
    }
  end,
}
