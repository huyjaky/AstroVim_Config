-- @NOTE: global var for lib scroll animate
vim.opt.list = true
vim.opt.listchars:append "eol:↴"

-- @NOTE: global var for lib trouble
local prefix = "<leader>x"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱍼 " or ""
maps.n[prefix] = { desc = icon .. "Trouble" }
require("astronvim.utils").set_mappings(maps)

-- @NOTr: config for blankline plugins
local highlight = {
  "RainbowRed",
  "RainbowBlue",
  "RainbowGreen",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

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
    main = "ibl",
    event = "User AstroFile",
    opts = {
      indent = {
        smart_indent_cap = true,
      },
      debounce = 100,
      scope = {
        -- @WARNING: test code
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,
        highlight = { "Function", "Label" },
        priority = 500,
      },
    },
    -- config = function() require("ibl").setup { indent = { highlight = highlight } } end,
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
      enable_git_status = false,
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
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.tabline = nil
      return opts
    end,
  },

  {
    "SirVer/ultisnips",
    opts = function(_, opts) return opts end,
  },

  --@NOTE: Debugger python setup
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    enabled = true
    -- config = function(_, opts) require("dap.utils").load_mappings "dap" end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      -- require("core.utils").load_mappings "dap_python"
    end,
  },
}
