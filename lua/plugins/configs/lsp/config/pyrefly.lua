return {
  settings = {
    python = {
      pyrefly = {
        displayTypeErrors = "force-off",
        -- strict = false,
        disabledLanguageServices = {
          "textDocument/definition",
          "textDocument/rename",
          "textDocument/references",
          "textDocument/documentHighlight",
          "textDocument/signatureHelp",
          -- "workspace/symbol",
          "textDocument/formatting",
          "textDocument/rangeFormatting",
        },
        analysis = {
          diagnosticMode = "workspace",
          showHoverGoToLinks = false,
        },
      },
    },
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
  on_init = function(client)
    client.server_capabilities.diagnosticProvider = nil
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.renameProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath "python3"
  end,
}
