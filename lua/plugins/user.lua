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
      handler_option = {
        border = "rounded",
      },
      hint_enable = false,
      doc_lines = 0,
    },
    -- config = function() require("lsp_signature").setup() end,
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
