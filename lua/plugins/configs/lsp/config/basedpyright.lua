return {
  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath "python3"
  end,
  settings = {

    python = false,
    basedpyright = {
      disableLanguageServices = false,
      disableOrganizeImports = true,
      disableTaggedHints = true,
      useLibraryCodeForTypes = true,
      openFilesOnly = true,

      analysis = {
        verboseOutput = false,
        autoImportCompletions = false,
        pythonPlatform = "Linux",
        autoSearchPaths = true,
        deprecateTypingAliases = false,
        logLevel = "Error",
        typeCheckingMode = "off",
        inlayHints = {
          variableTypes = false,
          genericTypes = true,
          callArgumentNames = true,
        },
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
