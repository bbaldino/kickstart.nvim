return {
  'mrcjkb/rustaceanvim',
  version = '^3', -- Recommended
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        float_win_config = {
          auto_focus = true
        }
      }
    }
  end
}
