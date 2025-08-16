-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMs" } },
    true,
    {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- NOTE: ENV
-- Disable Copilot tab mapping
vim.g.copilot_no_tab_map = true

require("lazy_setup")
require("polish")
require("core.lsp")


-- local function silent_hover()
--   local params = vim.lsp.util.make_position_params()
--   vim.lsp.buf_request(0, 'textDocument/hover', params, function(err, result, ctx, config)
--     if err then
--       -- Silently ignore errors instead of showing them
--       return
--     end
--     if result and result.contents then
--       vim.lsp.util.stylize_markdown(result.contents.value or result.contents, {})
--     end
--   end)
-- end

-- -- Remap K to use silent hover
-- vim.keymap.set({'n', 'v'}, 'K', silent_hover, { silent = true })

-- Keep K for documentation in normal mode, but disable in visual mode
