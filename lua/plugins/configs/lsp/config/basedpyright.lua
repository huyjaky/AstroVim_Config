return {
  before_init = function(_, c)
    if not c.settings then c.settings = {} end
    if not c.settings.python then c.settings.python = {} end
    c.settings.python.pythonPath = vim.fn.exepath "python"
  end,
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      -- disableLanguageServices = true,
      autoImportCompletions = false,
      disableTaggedHints = true,
      useLibraryCodeForTypes = false,
      analysis = {
        -- diagnosticMode = "workspace",
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic",
        autoImportCompletions = false,
        autoSearchPath = false,
        indexing = false,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = false,
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
        reportGeneralTypeIssues = false,
        diagnosticSeverityOverrides = {
          reportUnusedImport = false,
          reportUnusedFunction = false,
          reportUnusedVariable = false,
          reportGeneralTypeIssues = false,
          reportOptionalMemberAccess = false,
          reportOptionalSubscript = false,
          reportPrivateImportUsage = false,
          reportInvalidStubStatement = false,
          reportIncompleteStub = false,
          reportArgumentType = false,
          reportAttributeAccessIssue = false,

          -- reportCallIssue = false,
          -- reportNoOverloadImplementation = false,
          -- reportOverlappingOverload = false,
          -- reportInconsistentOverload = false,
          -- reportUnknownMemberType = false,
          -- reportFunctionMemberAccess = false,
          -- reportPropertyTypeMismatch = false,
          -- reportMatchNotExhaustive = false,
          -- reportInvalidTypeForm = false,
          -- reportAbstractUsage = false,

          -- reportAssertTypeFailure = false,
          -- reportAssignmentType = false,

          -- reportIndexIssue = false,
          -- reportInvalidTypeArguments = false,
          -- reportOperatorIssue = false,
          -- reportOptionalCall = false,
          -- reportOptionalIterable = false,
        },
      },
    },
  },
}
