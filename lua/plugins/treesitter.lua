-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "c",
      "cpp",
      "python",
      -- "javascript",
    })
    opts.highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      custom_captures = {
        -- Highlight local variables
        ["variable.local"] = "Identifier",
      },
    }

    vim.api.nvim_set_hl(0, "Identifier", { fg = "#55ffff" })
  end,
}
