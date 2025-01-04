return {
  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath "python"
  end,
  settings = {
    basedpyright = {

      disableOrganizeImports = true,

      analysis = {
        -- diagnosticMode = "workspace",
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic",
        autoImportCompletions = false,
        autoSearchPath = false,
        logLevel = "error",
        indexing = true,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
          callArgumentNames = false,
          pytestParameters = true,
        },
        useLibraryCodeForTypes = false,
        deprecateTypingAliases = false,
        enableReachabilityAnalysis = false,

        strictListInference = true,
        strictDictionaryInference = true,
        strictSetInference = true,

        analyzeUnannotatedFunctions = false,
        -- ignore = { "**/*.py" },

        diagnosticSeverityOverrides = {
          reportUnusedImport = "none",
          reportUnusedFunction = "none",
          reportUnusedVariable = "none",
          reportGeneralTypeIssues = "none",
          reportOptionalMemberAccess = "none",
          reportOptionalSubscript = "none",
          reportPrivateImportUsage = "none",
          reportInvalidStubStatement = "none",
          reportIncompleteStub = "none",
        },
      },
    },
  },
}
