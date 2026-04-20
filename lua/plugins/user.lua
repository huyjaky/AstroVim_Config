-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  "andweeb/presence.nvim",

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      floating_window = false,
      handler_option = {
        border = "rounded",
      },
      hint_enable = true,
      doc_lines = 0,
      hint_prefix = {
        above = "󰦸   ", -- when the hint is on the line above the current line
        current = "󰜱   ", -- when the hint is on the same line
        below = "󰧄   ", -- when the hint is on the line below the current line
      },
      hi_parameter = "MyCustomHintColor",
      doc_lines = 0,
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "MyCustomHintColor", { fg = "#98C379", italic = true })
      require("lsp_signature").setup(opts)
      local orig_extmark = vim.api.nvim_buf_set_extmark
      vim.api.nvim_buf_set_extmark = function(buf, ns, line, col, e_opts)
        local lsp_sig_ns = vim.api.nvim_create_namespace "lsp_signature_vt"
        if ns == lsp_sig_ns and e_opts and e_opts.virt_text then
          local vt = e_opts.virt_text
          if vt[2] and type(vt[2][1]) == "string" then
            local text = vt[2][1]
            local max_chars = 40
            if vim.fn.strchars(text) > max_chars then vt[2][1] = vim.fn.strcharpart(text, 0, max_chars) .. "..." end
          end

          if vt[1] and type(vt[1][1]) == "string" and string.match(vt[1][1], "^%s*$") then
            local cur_line_text = vim.api.nvim_get_current_line()
            local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
            local cursor_width = vim.fn.strdisplaywidth(cur_line_text:sub(1, cursor_col))
            local target_line_text = vim.api.nvim_buf_get_lines(buf, line, line + 1, false)[1] or ""
            local target_line_width = vim.fn.strdisplaywidth(target_line_text)

            local needed_pad = cursor_width - target_line_width
            if needed_pad < 1 then needed_pad = 1 end
            vt[1][1] = string.rep(" ", needed_pad)
          end
        end
        return orig_extmark(buf, ns, line, col, e_opts)
      end
    end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    config = function(_, opts) require("snacks").setup(opts) end,
    opts = {
      dashboard = {
        preset = {
          header = table.concat(require("plugins.configs.ui.alpha")[10], "\n"),
          keys = {},
        },
      },
      indent = require "plugins.configs.ui.indent",
      dim = { enabled = false },
      terminal = { enabled = false },
      profiler = { enabled = false },
    },
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "altermo/ultimate-autopair.nvim",
    event = "InsertEnter",
    -- branch = "v0.6",
    opts = {
      cmap = false,
      extensions = {
        cond = {
          cond = {
            function(fn) return not fn.in_node "comment" end,
          },
        },
        fly = {
          nofilter = true,
        },
      },
    },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>ua"] = {
                desc = "Toggle Ultimate Autopair",
                function()
                  local notify = require("astrocore").notify
                  local function bool2str(bool) return bool and "on" or "off" end
                  local ok, ultimate_autopair = pcall(require, "ultimate-autopair")
                  if ok then
                    ultimate_autopair.toggle()
                    vim.g.ultimate_autopair_enabled = require("ultimate-autopair.core").disable
                    notify(string.format("ultimate-autopair %s", bool2str(not vim.g.ultimate_autopair_enabled)))
                  else
                    notify "ultimate-autopair not available"
                  end
                end,
              },
            },
          },
        },
      },
    },
    specs = {
      {
        "windwp/nvim-autopairs",
        optional = true,
        enabled = false,
      },
    },
  },
}
