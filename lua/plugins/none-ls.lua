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
      }
      return opts
    end,
  },
  
}
