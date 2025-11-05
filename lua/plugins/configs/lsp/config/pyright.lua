return {
  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath "python3"
  end,
  settings = {
    python = {
      disableLanguageServices = true,
      disableOrganizeImports = true,
      disableTaggedHints = true,
      openFilesOnly = true,
      useLibraryCodeForTypes = false,

      analysis = {
        useLibraryCodeForTypes = false,
        autoImportCompletions = false,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "off",
        autoSearchPath = false,
        logLevel = "Error",
        verboseOutput = false,
        pythonPlatform = "Linux",
        exclude = {
          "**/unsloth_compiled_cache/**",
          "**/__pycache__/**",
          "**/.venv/**",
          "__index__",
          "**/.*",
        },
        ignore = {
          "**/unsloth_compiled_cache/**",
          "**/__pycache__/**",
          "__index__",
          "**/.venv/**",
          "**/*.ipynb",
        },
      },
    },
  },
}
