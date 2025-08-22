return {
  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath "python3"
  end,
  settings = {
    basedpyright = {
      disableLanguageServices = false,
      disableOrganizeImports = true,
      disableTaggedHints = true,

      useLibraryCodeForTypes = false,
      openFilesOnly = true,

      analysis = {
        autoSearchPath = false,
        useLibraryCodeForTypes = false,
        logLevel = "Trace",

        typeCheckingMode = "basic",
        deprecateTypingAliases = false,
        diagnosticMode = "openFilesOnly",
        inlayHints = {
          variableTypes = true,
          genericTypes = true,
          callArgumentNames = false,
        },
        ignore = {
          "**/unsloth_compiled_cache/**",
          "**/__pycache__/**",
          "__index__",
        },
        autoImportCompletions = false,
      },
    },
  },
}
