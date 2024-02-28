return
{
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = {
    {
      -- "<leader>tt",
      "<C-l>",
      mode = { 'n', 't' },
      "<cmd>ToggleTerm<CR>",
      desc = "Toggle terminal",
    }
  },
  config = function()
    require("toggleterm").setup {
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      size = 10,
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      shading_factor = 2,
      direction = "float",
      float_opts = { border = "rounded" },
    }
  end,
}
