  -- Auto-save functionality
return  {
    "okuuva/auto-save.nvim",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          autoformat_toggle = {
            {
              event = "User",
              desc = "Disable autoformat before saving",
              pattern = "AutoSaveWritePre",
              callback = function()
                vim.g.OLD_AUTOFORMAT = vim.g.autoformat
                vim.g.autoformat = false
                local old_autoformat_buffers = {}
                for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                  if vim.b[bufnr].autoformat then
                    table.insert(old_autoformat_buffers, bufnr)
                    vim.b[bufnr].autoformat = false
                  end
                end
                vim.g.OLD_AUTOFORMAT_BUFFERS = old_autoformat_buffers
              end,
            },
            {
              event = "User",
              desc = "Re-enable autoformat after saving",
              pattern = "AutoSaveWritePost",
              callback = function()
                vim.g.autoformat = vim.g.OLD_AUTOFORMAT
                for _, bufnr in ipairs(vim.g.OLD_AUTOFORMAT_BUFFERS or {}) do
                  vim.b[bufnr].autoformat = true
                end
              end,
            },
          },
        },
      },
    },
    opts = {},
  }

