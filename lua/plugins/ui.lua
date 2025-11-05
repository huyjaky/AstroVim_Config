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

}
