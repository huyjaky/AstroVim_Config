-- Motion, Navigation and Multiple Cursors
return {
  -- Multi-cursors support
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" } },
      { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" } },
      { "<A-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" } },
      { "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" } },
      { "<C-D>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" } },
    },
  },
  
  -- Alternative multi-cursor plugin
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
  },
  
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
  
  -- Disabled motion plugins
  { "Wansmer/treesj", enabled = false },
}
