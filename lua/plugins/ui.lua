return {
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup {
        integrations = { mini = true },
        terminal_colors = false,
      }
      require("bamboo").load()
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.statusline = require("plugins.configs.ui.heirline").statusline
      opts.winbar = require("plugins.configs.ui.heirline").winbar
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      preset = "helix",
      layout = {
        height = { min = 6 },
      },
    },
    keys = {
      {
        "<leader>?",
        function() require("which-key").show { global = false } end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    ft = function()
      local plugin = require("lazy.core.config").spec.plugins["markview.nvim"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      return opts.filetypes or { "markdown", "quarto", "rmd" }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed =
            require("astrocore").list_insert_unique(opts.ensure_installed, { "html", "markdown", "markdown_inline" })
        end
      end,
      "saghen/blink.cmp"
    },
    opts = {
      preview = {
        hybrid_modes = { "n" },
        headings = { shift_width = 0 },
      },
    },
  },
}
