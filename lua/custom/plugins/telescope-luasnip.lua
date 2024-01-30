return {
  "benfowler/telescope-luasnip.nvim",
  module = "telescope._extensions.luasnip",
  keys = {
    {
      "<leader>sl",
      function()
        vim.cmd("Telescope luasnip")
      end,
      desc = "[S]earch [L]uasnips"
    }
  },
}
