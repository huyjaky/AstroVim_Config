return {
  -- {
  --   "github/copilot.vim",
  --   event = "InsertEnter",
  --   config = function()
  --     vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("\\<CR>")', { expr = true, silent = true })
  --   end,
  -- },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-f>",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-l>",
        },
      },
      panel = {
        enabled = false,
        keymap = {
          open = "<C-h>",
        },
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuOpen",
        callback = function() vim.b.copilot_suggestion_hidden = true end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuClose",
        callback = function() vim.b.copilot_suggestion_hidden = false end,
      })
    end,
  },
  {
    "Saghen/blink.cmp",
    opts = {
      signature = {
        enabled = false,
      },
      keymap = {
        preset = "default",
        ["<C-f>"] = false,
        ["<C-n>"] = false,
        ["<C-p>"] = false,
      },
      term = {
        enabled = false,
      },
      source = {
        providers = {
          snippets = {
            opts = {
              friendly_snippets = {
                enable = false,
              },
            },
          },
        },
      },
      completion = {
        list = {
          selection = {
            preselect = true,
            -- auto_insert = true,
          },
        },
        ghost_text = {
          enabled = false,
        },
        menu = {
          auto_show = true,
          auto_show_delay_ms = 0,
          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
              { "kind", gap = 1 },
            },
          },
        },
        accept = {
          auto_brackets = { enabled = false },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          },
        },
      },
    },
  },
}
