return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rouge8/neotest-rust",
  },
  keys = {
    {
      "<leader>ct",
      function()
        require("neotest").run.run()
      end,
      desc = "Run closest test"
    },
    {
      "<leader>cT",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run all tests in file"
    },
    {
      "<leader>cs",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle test summary"
    },
    {
      "<leader>co",
      function()
        require("neotest").output.open {
          enter = true,
          open_win = function(settings)
            local height = math.min(settings.height, vim.o.lines - 2)
            local width = math.min(settings.width, vim.o.columns - 2)
            return vim.api.nvim_open_win(0, true, {
              relative = "editor",
              row = 7,
              col = (vim.o.columns - width) / 2,
              width = width,
              height = height,
              style = "minimal",
              border = vim.g.floating_window_border,
              noautocmd = true,
            })
          end,
        }
      end,
      desc = "Open test output"
    },
    {
      "<leader>cp",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle test output panel",
    },
    {
      "<leader>cw",
      function()
        require("neotest").watch.toggle(vim.fn.expand("%"))
      end,
      desc = "Watch tests in this file"
    }
  },
  config = function()
    require("neotest").setup({
      output = {
        open_on_run = true,
      },
      adapters = {
        require("neotest-rust")
      }
    })
  end
}
