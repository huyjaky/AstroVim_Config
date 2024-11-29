return {
  "echasnovski/mini.move",
  keys = function(_, keys)
    local plugin = require("lazy.core.config").spec.plugins["mini.move"]
    local opts = require("lazy.core.plugin").values(plugin, "opts", false) -- resolve mini.clue options
    -- Populate the keys based on the user's options
    local mappings = {
      { opts.mappings.line_left, desc = "Move line left" },
      { opts.mappings.line_right, desc = "Move line right" },
      { opts.mappings.line_down, desc = "Move line down" },
      { opts.mappings.line_up, desc = "Move line up" },
      { opts.mappings.left, desc = "Move selection left", mode = "v" },
      { opts.mappings.right, desc = "Move selection right", mode = "v" },
      { opts.mappings.down, desc = "Move selection down", mode = "v" },
      { opts.mappings.up, desc = "Move selection up", mode = "v" },
    }
    mappings = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, mappings)
    return vim.list_extend(mappings, keys)
  end,
  opts = {
    mappings = {
      left = "<A-a>",
      right = "<A-d>",
      down = "<A-s>",
      up = "<A-w>",
      line_left = "<A-a>",
      line_right = "<A-d>",
      line_down = "<A-s>",
      line_up = "<A-w>",
    },
  },
  specs = {
    {
      "bamboo", -- Replace with the correct name for the Bamboo colorscheme package if necessary
      optional = true,
      ---@type BambooOptions  -- Adjust type if Bamboo has specific options
      opts = { integrations = { mini = true } },
    },
  },
}
