return function()
  -- Jump to last position in buffer and center it on screen
  vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Open file at the last position it was edited earlier',
    group = misc_augroup,
    pattern = '*',
    command = 'silent! normal! g`"zz'
  })

  vim.wo.relativenumber = true

  -- Add a shortcut to clear search highlight
  vim.keymap.set('n', '<leader>,', ':nohlsearch<CR>', { desc = 'Clear search highlight' })

  vim.keymap.set('n', 'gT', '<cmd>tab split | lua vim.lsp.buf.definition()<CR>',
    { desc = '[G]oto definition in new [t]ab' })

  vim.keymap.set('n', '<leader>th', '<cmd>lua vim.lsp.inlay_hint(0)<CR>', { desc = "Toggle inlay hints" })
  vim.keymap.set('n', '<leader>tc', '<cmd>TSContextToggle<CR>', { desc = "Toggle treesitter context" })

  require('luasnip.loaders.from_lua').lazy_load()
  local luasnip = require 'luasnip'
  local types = require("luasnip.util.types")
  luasnip.config.setup {
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "[Choices available]", "PortalOrange" } },
          hl_mode = "combine"
        }
      },
    }
  }
  vim.api.nvim_create_autocmd("ModeChanged", {
    group = vim.api.nvim_create_augroup("UnlinkLuaSnipSnippetOnModeChange", {
      clear = true,
    }),
    pattern = { "s:n", "i:*" },
    desc = "Forget the current snippet when leaving the insert mode",
    callback = function(evt)
      -- If we have n active nodes, n - 1 will still remain after a `unlink_current()` call.
      -- We unlink all of them by wrapping the calls in a loop.
      while true do
        if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
          luasnip.unlink_current()
        else
          break
        end
      end
    end,
  })

  vim.keymap.set("i", "<c-l>", function()
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end)

  require('telescope').load_extension('luasnip')

  local function open_cargo_file()
    local cargo_file = vim.fn.findfile("Cargo.toml", ".;")
    vim.cmd('vnew ' .. cargo_file)
  end

  vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("rust-cargo", { clear = true }),
    pattern = "*.rs",
    callback = function()
      vim.keymap.set('n', '<leader>mc', open_cargo_file,
        { desc = "[M]odify the nearest [C]argo.toml file" })
    end
  })
  vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
      local cmp = require("cmp")
      cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
  })
end
