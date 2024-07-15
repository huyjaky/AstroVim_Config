if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "codelldb", -- CodeLLDB
        "debugpy", -- Debugpy for Python
        "eslint-lsp",
        "eslint", -- ESLint
        "isort", -- Isort for Python
        "js-debug-adapter", -- JS Debug Adapter
        "json-lsp",
        "jsonls", -- JSON Language Server
        "lua-language-server",
        "lua_ls", -- Lua Language Server
        "prettierd", -- Prettier Daemon
        "pyright", -- Pyright for Python
        "ruff", -- Ruff for Python
        "ruff_lsp", -- Ruff Language Server
        "selene", -- Selene for Lua
        "stylua", -- StyLua for Lua
        "taplo", -- Taplo for TOML
        "ts-standard", -- TypeScript Standard
        "typescript-language-server",
        "tsserver", -- TypeScript Language Server
        "vtsls", -- VTSLS for TypeScript
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
