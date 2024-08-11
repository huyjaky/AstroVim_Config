return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },

  config = function()
    require("noice").setup {
      -- Configuration here, or leave empty to use defaults
      views = {
        -- cmdline_popup = {
        --   position = {
        --     row = "50%",
        --     col = "50%",
        --   },
        --   size = {
        --     width = 60,
        --     height = "auto",
        --   },
        -- },
        -- popupmenu = {
        --   relative = "editor",
        --   position = {
        --     row = 8,
        --     col = "50%",
        --   },
        --   size = {
        --     width = 60,
        --     height = 10,
        --   },
        --   border = {
        --     style = "rounded",
        --     padding = { 0, 1 },
        --   },
        --   win_options = {
        --     winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        --   },
        -- },
      },
      messages = {
        enabled = false, -- disables the Noice messages UI
      },
      notify = {
        enabled = false, -- disables Noice notifications
      },
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false, -- disables Noice LSP hover
        },
        signature = {
          enabled = false, -- disables Noice LSP signature help
        },
        message = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },

      routes = {
        -- disable "written" notification
        {
          filter = { event = "msg_show", kind = "", find = "written" },
          opts = { skip = true },
        },
        -- disable paste/undo notification
        {
          filter = { event = "msg_show", find = "^%d+ more lines" },
          opts = { skip = true },
        },
        -- disable delete/undo notification
        {
          filter = { event = "msg_show", find = "^%d+ fewer lines" },
          opts = { skip = true },
        },
        -- disable yank notification
        {
          filter = { event = "msg_show", find = "^%d+ lines yanked$" },
          opts = { skip = true },
        },
        -- disable move notification
        {
          filter = { event = "msg_show", find = "^%d+ lines moved$" },
        },
      },
    }
  end,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed = require("astrocore").list_insert_unique(
            opts.ensure_installed,
            { "bash", "markdown", "markdown_inline", "regex", "vim" }
          )
        end
      end,
    },
    {
      "AstroNvim/astrolsp",
      optional = true,
      ---@param opts AstroLSPOpts
      opts = function(_, opts)
        -- No need to manage lsp_handlers as noice is not handling them now
      end,
    },
    {
      "heirline.nvim",
      optional = true,
      opts = function(_, opts)
        local noice_opts = require("astrocore").plugin_opts "noice.nvim"
        if vim.tbl_get(noice_opts, "lsp", "progress", "enabled") ~= false then -- check if lsp progress is enabled
          opts.statusline[9] = require("astroui.status").component.lsp { lsp_progress = false }
        end
      end,
    },
    {
      "folke/edgy.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.bottom then opts.bottom = {} end
        table.insert(opts.bottom, {
          ft = "noice",
          size = { height = 0.4 },
          filter = function(_, win) return vim.api.nvim_win_get_config(win).relative == "" end,
        })
      end,
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { noice = true } },
    },
  },
}
