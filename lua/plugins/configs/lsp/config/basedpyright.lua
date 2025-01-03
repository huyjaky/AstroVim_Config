return {
  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath "python"
  end,
  settings = {
    basedpyright = {

      analysis = {
        -- diagnosticMode = "workspace",
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "off",
        autoImportCompletions = false,
        autoSearchPath = false,
        logLevel = "error",
        indexing = true,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
          callArgumentNames = true,
          pytestParameters = true,
        },
        useLibraryCodeForTypes = false,
        strictListInference = true,
        strictDictionaryInference = true,
        deprecateTypingAliases = false,
        enableReachabilityAnalysis = false,

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
