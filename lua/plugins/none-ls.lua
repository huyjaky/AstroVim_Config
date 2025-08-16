-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  opts = function(_, opts)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require("null-ls")

    opts.sources = {
      require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "F" } }),
      require("none-ls.formatting.ruff_format"), -- Set a formatter

    }
    return opts
  end,
}
