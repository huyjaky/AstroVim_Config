-- Formatting and Linting
return {
  -- None-ls formatting
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = {
        require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "F" } }),
        require("none-ls.formatting.ruff_format"),
      }
      return opts
    end,
  },
  
  -- Disabled formatting plugins
  { "rafamadriz/friendly-snippets", enabled = false },
  { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
  { "windwp/nvim-ts-autotag", enabled = false },
}
