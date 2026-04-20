-- Some commands that I want to execute in specific timing
vim.api.nvim_create_augroup("disable_comment_newline", { clear = true })
vim.api.nvim_create_augroup("auto_wrap", { clear = true })
vim.api.nvim_create_augroup("disable_suspend_with_c_z", { clear = true })
vim.api.nvim_create_augroup("clear_last_search", { clear = true })
-- vim.keymap.set("v", "K", "<Nop>", { silent = true })

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Disable auto insert comment newline",
  group = "disable_comment_newline",
  command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable wrap and spell for text like documents",
  group = "auto_wrap",
  pattern = { "gitcommit", "markdown", "text", "plaintext" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Remap <C-z> to nothing so that it doesn't suspend terminal",
  group = "disable_suspend_with_c_z",
  command = "nnoremap <c-z> <nop>",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Clear last search pattern",
  group = "clear_last_search",
  pattern = "*",
  command = "let @/ = ''",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function() vim.opt_local.spell = false end,
})

local function get_conda_python_path()
  local conda_prefix = os.getenv("CONDA_PREFIX")
  if conda_prefix then
    return conda_prefix .. "/bin/python"
  end
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

vim.lsp.enable "pyrefly"
vim.lsp.config("pyrefly", {
  cmd = { "pyrefly", "lsp" }, 
  filetypes = { "python" },
  root_markers = {
    "pyrefly.toml",
    "pyproject.toml",
    ".git",
  },
  settings = {
    python = {
      pyrefly = {
        displayTypeErrors = "force-off", 
        -- strict = false,
        disabledLanguageServices = {
            "textDocument/definition",
            "textDocument/rename",
            "textDocument/references",
            "textDocument/documentHighlight",
            "textDocument/signatureHelp",
            -- "workspace/symbol",
            "textDocument/formatting",     
            "textDocument/rangeFormatting" 
        },
        analysis = {
          diagnosticMode = "workspace",
          showHoverGoToLinks = false, 
        },
      },
    },
  },
  
  on_init = function(client)
    client.server_capabilities.diagnosticProvider = nil
    client.server_capabilities.definitionProvider = false
    --
    client.server_capabilities.renameProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})
