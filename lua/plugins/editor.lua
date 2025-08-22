-- Editor Enhancements
return {
  -- Comment management
  {
    "numToStr/Comment.nvim",
    opts = {
      ignore = "^$",
    },
    keys = {
      {
        "<C-_>",
        function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
        mode = { "n", "i" },
        desc = "Comment line",
      },
      {
        "<C-_>",
        "<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        mode = { "v" },
        desc = "Comment block",
      },
    },
  },
  
  -- Auto-save functionality
  {
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
  },
  
  -- Indent scope highlighting
  {
    "echasnovski/mini.indentscope",
    event = "User AstroFile",
    opts = function()
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#FF4500" })
      return {
        options = { try_as_border = true, border = "both" },
        symbol = require("astrocore").plugin_opts("indent-blankline.nvim").context_char or "󰥓",
        draw = {
          delay = 0,
          animation = function(s, n) return 10 end,
        },
      }
    end,
    dependencies = {
      {
        "lukas-reineke/indent-blankline.nvim",
        optional = true,
        opts = { scope = { enabled = false } },
      },
      {
        "AstroNvim/astrocore",
        opts = {
          autocmds = {
            mini_indentscope = {
              {
                event = "FileType",
                desc = "Disable indentscope for certain filetypes",
                callback = function(event)
                  if vim.b[event.buf].miniindentscope_disable == nil then
                    local filetype = vim.bo[event.buf].filetype
                    local blankline_opts = require("astrocore").plugin_opts "indent-blankline.nvim"
                    local ignore_filetypes = {
                      "aerial", "alpha", "dashboard", "help", "lazy", "mason", "neo-tree",
                      "NvimTree", "neogitstatus", "notify", "startify", "toggleterm", "Trouble",
                    }
                    if vim.tbl_contains(blankline_opts.filetype_exclude or ignore_filetypes, filetype) then
                      vim.b[event.buf].miniindentscope_disable = true
                    end
                  end
                end,
              },
              {
                event = "BufWinEnter",
                desc = "Disable indentscope for certain buftypes",
                callback = function(event)
                  if vim.b[event.buf].miniindentscope_disable == nil then
                    local buftype = vim.bo[event.buf].buftype
                    local blankline_opts = require("astrocore").plugin_opts "indent-blankline.nvim"
                    local ignore_buftypes = {
                      "nofile", "prompt", "quickfix", "terminal",
                    }
                    if vim.tbl_contains(blankline_opts.buftype_exclude or ignore_buftypes, buftype) then
                      vim.b[event.buf].miniindentscope_disable = true
                    end
                  end
                end,
              },
              {
                event = "TermOpen",
                desc = "Disable indentscope for terminals",
                callback = function(event)
                  if vim.b[event.buf].miniindentscope_disable == nil then
                    vim.b[event.buf].miniindentscope_disable = true
                  end
                end,
              },
            },
          },
        },
      },
    },
  },
  
  -- Better code folding
  {
    "kevinhwang91/nvim-ufo",
    opts = {
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰁂 %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0

        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
    },
  },
  
  -- Better split navigation and resize
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.ignored_filetypes = { "nofile", "quickfix", "qf", "prompt", "NvimTree" }
      opts.ignored_buftypes = { "nofile" }
      opts.log_level = "error"
    end,
    keys = {
      {
        "<C-h>",
        function() require("smart-splits").move_cursor_left() end,
        mode = { "n" },
        desc = "Move to left split",
      },
      {
        "<C-l>",
        function() require("smart-splits").move_cursor_right() end,
        mode = { "n", "t" },
        desc = "Move to right split",
      },
      {
        "<C-k>",
        function() require("smart-splits").move_cursor_up() end,
        mode = { "n" },
        desc = "Move to above split",
      },
      {
        "<C-j>",
        function() require("smart-splits").move_cursor_down() end,
        mode = { "n" },
        desc = "Move to below split",
      },
      {
        "<S-h>",
        function() require("smart-splits").resize_left() end,
        mode = { "n" },
        desc = "Resize split left",
      },
      {
        "<S-l>",
        function() require("smart-splits").resize_right() end,
        mode = { "n" },
        desc = "Resize split right",
      },
    },
  },
  
  -- Built-in terminal support
  {
    "akinsho/toggleterm.nvim",
    enabled = false,
    opts = function(_, opts)
      -- Use powershell for toggleterm on windows
      -- if vim.fn.has "win32" then opts.shell = "pwsh.exe" end
    end,
  },
  
  -- Disabled editor plugins
  { "max397574/better-escape.nvim", enabled = false },
  { "hinell/duplicate.nvim", enabled = false },
  { "CRAG666/code_runner.nvim", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },
  { "echasnovski/mini.bufremove", enabled = false },
}
