return {
	before_init = function(_, c)
		if not c.settings then
			c.settings = {}
		end
		if not c.settings.python then
			c.settings.python = {}
		end
		c.settings.python.pythonPath = vim.fn.exepath("python")
	end,
	settings = {
		basedpyright = {
			disableLanguageServices = false,
			disableOrganizeImports = true,
			disableTaggedHints = true,

			analysis = {
				autoSearchPath = false,
				logLevel = "Trace",
				typeCheckingMode = "standard",
				deprecateTypingAliases = false,
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
					callArgumentNames = true,
					pytestParameters = true,
				},
				ignore = {
					"unsloth_compiled_cache",
					"__pycache__",
					"__index__",
				},
				useLibraryCodeForTypes = true,
			},
			autoImportCompletions = false,
		},
	},
}
