return {
  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath("python3")
  end,
  settings = {
    python = {
      disableLanguageServices = true,
      disableOrganizeImports = true,
      analysis = {
        diagnosticMode = "openFilesOnly",
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
}
