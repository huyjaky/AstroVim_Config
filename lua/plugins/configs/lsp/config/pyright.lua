return {
  settings = {
    python = {
      disableLanguageServices = true,
      disableOrganizeImports = true,
      analysis = {
        diagnosticSeverityOverrides = {
          reportMissingImports = "none",
        },
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
        useLibraryCodeForTypes = false,
        autoImportCompletions = false,
        autoSearchPaths = false,
        logLevel = "Error",
        exclude = {
          "**/unsloth_compiled_cache/**",
          "**/__pycache__/**",
          "**/.venv/**",
          "**/venv/**",
          "**/.env/**",
          "**/.git/**",
        },
        ignore = {
          "**/unsloth_compiled_cache/**",
          "**/*.ipynb",
        },
      },
    },
  },

  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath "python3"
  end,

  on_init = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.signatureHelpProvider = nil
    client.server_capabilities.completionProvider = nil
    client.server_capabilities.codeLensProvider = nil
    client.server_capabilities.colorProvider = false
    client.server_capabilities.callHierarchyProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.declarationProvider = false
    client.server_capabilities.documentLinkProvider = nil
    client.server_capabilities.documentOnTypeFormattingProvider = nil
    client.server_capabilities.documentSymbolProvider = false
    client.server_capabilities.inlineCompletionProvider = false
    client.server_capabilities.inlineValueProvider = false
    client.server_capabilities.notebookDocumentSync = nil
    client.server_capabilities.typeDefinitionProvider = false
    client.server_capabilities.workspaceSymbolProvider = false
    client.server_capabilities.monikerProvider = false
    client.server_capabilities.semanticTokensProvider = nil
    client.server_capabilities.referencesProvider = false
    client.server_capabilities.implementationProvider = false
    client.server_capabilities.foldingRangeProvider = false
    client.server_capabilities.selectionRangeProvider = false
    client.server_capabilities.linkedEditingRangeProvider = false
    client.server_capabilities.executeCommandProvider = nil
    client.server_capabilities.workspace = {
      workspaceFolders = { supported = false },
      fileOperations = { supported = false },
    }
  end,
}
