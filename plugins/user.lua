-- @dependencies global var for lib scroll animate
vim.opt.list = true
vim.opt.listchars:append "eol:↴"

-- @dependencies global var for lib trouble
local prefix = "<leader>x"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱍼 " or ""
maps.n[prefix] = { desc = icon .. "Trouble" }
require("astronvim.utils").set_mappings(maps)

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
  },

  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup {
        transparent = true,
      }
    end,
  },

  -- @desc Scoll animate
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    cond = not vim.g.neovide,
    -- enabled = false,
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs { "Up", "Down" } do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require "mini.animate"
      return {
        resize = {
          timing = animate.gen_timing.linear { duration = 100, unit = "total" },
        },
        scroll = {
          timing = animate.gen_timing.linear { duration = 150, unit = "total" },
          subscroll = animate.gen_subscroll.equal {
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          },
        },
        cursor = {
          timing = animate.gen_timing.linear { duration = 80, unit = "total" },
        },
      }
    end,
  },

  -- @desc Lib config keymap for moving code
  {
    "matze/vim-move",
    event = "bufenter",
  },

  -- @desc lib for highlight tab for code
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User AstroFile",
    opts = {
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      space_char_blankline = "   ",
      show_current_context = true,
      show_current_context_start = true,
    },
  },

  -- @desc Lib for highlight variables input through function
  {
    "m-demare/hlargs.nvim",
    opts = {},
    event = "User AstroFile",
  },

  -- @desc lib for error in file
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { prefix .. "X", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { prefix .. "x", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { prefix .. "l", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { prefix .. "q", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },

  -- @desc auto show hidden file
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
  
  {
    "psf/black",
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "python",
      })
    end,
  },
}
