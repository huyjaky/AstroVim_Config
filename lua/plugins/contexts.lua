-- Treesitter context
return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User AstroFile",
    cmd = { "TSContext" },
    opts = {
      on_attach = function()
        vim.api.nvim_set_hl(0, "TreesitterContext", { underline = true, sp = "Red", bg = "#1e1e3f" })
      end,
      max_lines = 2,
    },
    dependencies = {
      "AstroNvim/astrocore",
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
  },

  -- Virtual text context
  {
    "andersevenrud/nvim_context_vt",
    event = "User AstroFile",
    cmd = { "NvimContextVtToggle" },
    opts = {
      prefix = " ",
      -- disable_virtual_lines = true,
    },
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uv"] = {
              function() require("nvim_context_vt").toggle() end,
              desc = "Toggle virutal text context",
            },
          },
        },
      },
    },
  },
}
