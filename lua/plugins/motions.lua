-- Motion, Navigation and Multiple Cursors
return {
  -- Multi-cursors support
  -- Alternative multi-cursor plugin
  {
    "mg979/vim-visual-multi",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = {
      "AstroNvim/astrocore",
      ---@param opts astrocoreopts
      opts = function(_, opts)
        if not opts.options then opts.options = {} end
        if not opts.options.g then opts.options.g = {} end
        opts.options.g.VM_silent_exit = 1
        opts.options.g.VM_show_warnings = 0

        if not opts.autocmds then opts.autocmds = {} end
        opts.autocmds.visual_multi_exit = {
          {
            event = "User",
            pattern = "visual_multi_exit",
            desc = "Avoid spurious 'hit-enter-prompt' when exiting vim-visual-multi",
            callback = function()
              vim.o.cmdheight = 1
              vim.schedule(function() vim.o.cmdheight = opts.options.opt.cmdheight end)
            end,
          },
        }

        if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
        local maps = assert(opts.mappings)
        maps.n["<C-up>"] = { "<C-u>call vm#commands#add_cursor_up(0, v:count1)<cr>", desc = "Add cursor above" }
        maps.n["<C-down>"] = { "<C-u>call vm#commands#add_cursor_down(0, v:count1)<cr>", desc = "Add cursor below" }
      end,
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
    keys = {
      { "<M-a>", mode = { "n", "v" }, desc = "Move left" },
      { "<M-s>", mode = { "n", "v" }, desc = "Move down" },
      { "<M-d>", mode = { "n", "v" }, desc = "Move right" },
      { "<M-w>", mode = { "n", "v" }, desc = "Move up" },
    },
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

  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.ignored_filetypes = { "nofile", "quickfix", "qf", "prompt", "NvimTree" }
      opts.ignored_buftypes = { "nofile" }
      opts.log_level = "error"
    end,
    keys = {
      {
        "<C-h>",
        function() require("smart-splits").move_cursor_left() end,
        mode = { "n" },
        desc = "Move to left split",
      },
      {
        "<C-l>",
        function() require("smart-splits").move_cursor_right() end,
        mode = { "n", "t" },
        desc = "Move to right split",
      },
      {
        "<C-k>",
        function() require("smart-splits").move_cursor_up() end,
        mode = { "n" },
        desc = "Move to above split",
      },
      {
        "<C-j>",
        function() require("smart-splits").move_cursor_down() end,
        mode = { "n" },
        desc = "Move to below split",
      },
      {
        "<S-h>",
        function() require("smart-splits").resize_left() end,
        mode = { "n" },
        desc = "Resize split left",
      },
      {
        "<S-l>",
        function() require("smart-splits").resize_right() end,
        mode = { "n" },
        desc = "Resize split right",
      },
    },
  },
}
