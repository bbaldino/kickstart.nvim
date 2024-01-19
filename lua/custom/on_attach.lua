return function(client, bufnr)
  print("in custom on_attach", client.server_capabilities)
  if client.server_capabilities.inlayHintProvider then
    print("inlay hints avaiable")
    -- Not loading correctly...https://github.com/neovim/nvim-lspconfig/issues/2876?
    -- vim.lsp.inlay_hint(0, true)
  end
end
