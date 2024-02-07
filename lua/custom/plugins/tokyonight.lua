return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_highlights = function(highlights, colors)
      highlights.TelescopeSelection = { bg = colors.bg_highlight }
    end
  },
}
