return {
  {
    "github/copilot.vim",
    event = "BufRead",
    config = function()
      vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("\\<CR>")', { expr = true, silent = true })
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
            -- preselect = true,
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
