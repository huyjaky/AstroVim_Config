-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {},
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ignore_install = { "help" }
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua",
        "python",
        -- "markdown",
        -- "markdown_inline",
        -- "vimdoc",
        -- "c",
        -- "cpp",
        -- "latex",
        -- "javascript",
      })

      opts.highlight = {
        enable = true,
        disable = { "c", "rust", "tsx", "javascript" },
        additional_vim_regex_highlighting = false,
        custom_captures = {
          -- Highlight local variables
          ["variable.local"] = "Identifier",
        },
      }
    end,
  },
}

