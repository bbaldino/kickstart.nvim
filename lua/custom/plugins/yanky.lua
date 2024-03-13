return {
  "gbprod/yanky.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function(_, opts)
    require("yanky").setup(opts)
    require("telescope").load_extension("yank_history")
  end,
  keys = {
    {
      "y",
      "<Plug>(YankyYank)",
      mode = { "n", "x" },
      desc = "Yank text"
    },
    {
      "p",
      "<Plug>(YankyPutAfter)",
      mode = { "n", "x" },
      desc = "Put yanked text after cursor",
    },
    {
      "[y",
      "<Plug>(YankyCycleForward)",
      desc = "Cycle forward through yank history"
    },
    {
      "]y",
      "<Plug>(YankyCycleBackward)",
      desc = "Cycle backward through yank history"
    },
    {
      "<leader>sy",
      function()
        vim.cmd("Telescope yank_history")
      end,
      desc = "[S]earch [Y]ank history",
    }
  },
}
