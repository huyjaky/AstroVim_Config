---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "User AstroFile",
  cmd = { "TSContext" },
  opts = {
    -- không có option trực tiếp cho border, nên ta set highlight ở đây
    on_attach = function()
      vim.api.nvim_set_hl(0, "TreesitterContext", { underline = true, sp = "Red", bg = "#1e1e3f" })
    end,
    max_lines = 2, -- 0 means no limit

  },
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>uT"] = {
            "<cmd>TSContext toggle<CR>",
            desc = "Toggle treesitter context",
          },
        },
      },
    },
  },
}
