return {
  init_options = {
    settings = {
      args = {},
    },
  },
  on_attach = function(client, bufnr)
    -- Disable hover and completion in favor of Pyright/Pyrefly
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.completionProvider = false
  end,
}
