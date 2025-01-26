-- Plugins related to UI
return {
  {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = require("plugins.configs.ui.alpha")[10]
      opts.section.buttons.val = {}
    end,
    -- config = function() require("alpha").setup(require("alpha.themes.startify").config) end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.statusline = require("plugins.configs.ui.heirline").statusline
      opts.winbar = require("plugins.configs.ui.heirline").winbar
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      -- Do this to prevent the warning
      opts.background_colour = "#000000"
      opts.timeout = 2000
      opts.fps = 60
      opts.render = "compact"
      opts.top_down = false
    end,
  },

  -- Transparent background
  -- {
  --   "xiyaowong/transparent.nvim",
  --   lazy = false,
  --   opts = function(_, opts) opts = require "plugins.configs.ui.transparent"(opts) end,
  --   keys = {
  --     { "<Leader>uT", "<Cmd>TransparentToggle<CR>", desc = "Toggle transparent" },
  --   },
  -- },
  {
    {
      "HiPhish/rainbow-delimiters.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        {
          "AstroNvim/astrocore",
          opts = {
            mappings = {
              n = {
                ["<Leader>u("] = {
                  function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    require("rainbow-delimiters").toggle(bufnr)
                    require("astrocore").notify(
                      string.format(
                        "Buffer rainbow delimeters %s",
                        require("rainbow-delimiters").is_enabled(bufnr) and "on" or "off"
                      )
                    )
                  end,
                  desc = "Toggle rainbow delimeters (buffer)",
                },
              },
            },
          },
        },
      },
      event = "User AstroFile",
      main = "rainbow-delimiters.setup",
      opts = {},
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below

      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        GOAL = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = "InsertEnter",
    branch = "v0.6", --recommended as each new version will have breaking changes
    opts = {
      -- disable autopair in the command line: https://github.com/altermo/ultimate-autopair.nvim/issues/8
      cmap = false,
      extensions = {
        cond = {
          -- disable in comments
          -- https://github.com/altermo/ultimate-autopair.nvim/blob/6fd0d6aa976a97dd6f1bed4d46be1b437613a52f/Q%26A.md?plain=1#L26
          cond = {
            function(fn) return not fn.in_node "comment" end,
          },
        },
        -- get fly mode working on strings:
        -- https://github.com/altermo/ultimate-autopair.nvim/issues/33
        fly = {
          nofilter = true,
        },
      },
      config_internal_pairs = {
        { '"', '"', fly = true },
        { "'", "'", fly = true },
        { "[", "]", fly = true },
        { "{", "}", fly = true },
        { "(", ")", fly = true },
        -- { "<", ">", fly = true },
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
