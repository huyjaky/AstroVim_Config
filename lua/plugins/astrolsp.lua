-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = false, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = false, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = require "plugins.configs.lsp.formatting",
    -- enable servers that you already have installed without mason

    servers = {}, -- customize language server configuration options passed to `lspconfig`

    ---@diagnostic disable: missing-fields
    config = {
      pyright = require "plugins.configs.lsp.config.pyright",
      -- basedpyright = require "plugins.configs.lsp.config.basedpyright",
      -- clangd = require "plugins.configs.lsp.config.clangd",
      -- jedi_language_server = require "plugins.configs.lsp.config.jedi_language",
      -- ruff = require "plugins.configs.lsp.config.ruff",
      -- pylsp = require "plugins.configs.lsp.config.pylsp",
    },
    -- customize how language servers are attached
    handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end
      -- config Ty

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)

      lsp_document_highlight = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/documentHighlight",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "CursorHold", "CursorHoldI" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Document Highlighting",
          callback = function() vim.lsp.buf.document_highlight() end,
        },
        {
          event = { "CursorMoved", "CursorMovedI", "BufLeave" },
          desc = "Document Highlighting Clear",
          callback = function() vim.lsp.buf.clear_references() end,
        },
      },

      -- NOTE: start
      -- disable inlay hints in insert mode
      disable_inlay_hints_on_insert = {
        -- only create for language servers that support inlay hints
        -- (and only if vim.lsp.inlay_hint is available)
        cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
        {
          -- when going into insert mode
          event = "InsertEnter",
          desc = "disable inlay hints on insert",
          callback = function(args)
            local filter = { bufnr = args.buf }
            -- if the inlay hints are currently enabled
            if vim.lsp.inlay_hint.is_enabled(filter) then
              -- disable the inlay hints
              vim.lsp.inlay_hint.enable(false, filter)
              -- create a single use autocommand to turn the inlay hints back on
              -- when leaving insert mode
              vim.api.nvim_create_autocmd("InsertLeave", {
                buffer = args.buf,
                once = true,
                callback = function() vim.lsp.inlay_hint.enable(true, filter) end,
              })
            end
          end,
        },
      },
      -- ----------------------------------------------------------------------------------
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {},
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil

      -- Disable ruff_lsp hover in favor of pyright
      -- if client.name == "ruff" then
      --   client.server_capabilities.hoverProvider = false
      --   client.server_capabilities.completionProvider = false
      -- end

      -- if client.name == "jedi_language_server" then client.server_capabilities.renameProvider = false end

      if client.name == "pyright" then
        -- client.server_capabilities.renameProvider = false
        -- client.server_capabilities.definitionProvider = false
        -- client.server_capabilities.diagnosticProvider = nil
        -- client.server_capabilities.inlayHintProvider = nil
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
      end
    end,
  },
}
