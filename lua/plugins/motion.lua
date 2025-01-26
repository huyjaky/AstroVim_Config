-- Plugins related to motion
return {
  -- Faster change/delete/replace delimiter pairs
  -- {
  --   "echasnovski/mini.surround",
  --   opts = { n_lines = 200 },
  --   keys = {
  --     { "sa", mode = { "n", "x" }, desc = "Add surrounding" },
  --     { "sd", mode = { "n", "x" }, desc = "Delete surrounding" },
  --     { "sr", mode = { "n", "x" }, desc = "Replace surrounding" },
  --     { "sf", mode = { "n", "x" }, desc = "Find right surrounding" },
  --     { "sF", mode = { "n", "x" }, desc = "Find left surrounding" },
  --     { "sh", mode = { "n", "x" }, desc = "Highlight surrounding" },
  --     { "sn", mode = { "n", "x" }, desc = "Update `MiniSurround.config.n_lines`" },
  --   },
  -- },
  -- Brackets splitjoin
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = {
      use_default_keymaps = false,
      max_join_length = 150,
    },
    keys = {
      { "gs", "<Cmd>TSJToggle<CR>", mode = { "n" }, desc = "Toggle splitjoin" },
    },
  },
  -- Better move by word
  {
    "chrisgrieser/nvim-spider",
    opts = {},
    keys = {
      { "w", "<Cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Spider-w" },
      { "e", "<Cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "Spider-e" },
      { "b", "<Cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Spider-b" },
      { "ge", "<Cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "Spider-ge" },
    },
  },
  -- Better character motion
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "gj", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
      {
        "gJ",
        function() require("flash").treesitter() end,
        mode = { "n", "x", "o" },
        desc = "Flash Treesitter",
      },
      { "r", function() require("flash").remote() end, mode = "o", desc = "Remote Flash" },
      {
        "R",
        function() require("flash").treesitter_search() end,
        mode = { "x", "o" },
        desc = "Treesitter Search",
      },
    },
  },
  -- Move code block
  {
    "echasnovski/mini.move",
    event = "BufRead",
    config = function()
      require("mini.move").setup {
        mappings = {
          left = "<M-a>",
          right = "<M-d>",
          down = "<M-s>",
          up = "<M-w>",
          line_left = "<M-a>",
          line_right = "<M-d>",
          line_down = "<M-s>",
          line_up = "<M-w>",
        },
      }
    end,
  },
}
