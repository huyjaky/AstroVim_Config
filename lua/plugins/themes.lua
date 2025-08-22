-- Themes and Colorschemes
return {
  -- Main colorscheme
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup {
        integrations = { mini = true },
        terminal_colors = false
      }
      require("bamboo").load()
    end,
  },
  
  -- Alternative themes (disabled)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    opts = {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      color_overrides = {
        mocha = {
          rosewater = "#efc9c2",
          flamingo = "#ebb2b2",
          pink = "#f2a7de",
          mauve = "#b889f4",
          red = "#ea7183",
          maroon = "#ea838c",
          peach = "#f39967",
          yellow = "#eaca89",
          green = "#96d382",
          teal = "#78cec1",
          sky = "#91d7e3",
          sapphire = "#68bae0",
          blue = "#739df2",
          lavender = "#a0a8f6",
          text = "#b5c1f1",
          subtext1 = "#a6b0d8",
          subtext0 = "#959ec2",
          overlay2 = "#848cad",
          overlay1 = "#717997",
          overlay0 = "#63677f",
          surface2 = "#505469",
          surface1 = "#3e4255",
          surface0 = "#2c2f40",
          base = "#1a1c2a",
          mantle = "#141620",
          crust = "#0e0f16",
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        gitsigns = true,
        illuminate = true,
        markdown = true,
        mason = true,
        native_lsp = true,
        neotree = true,
        notify = true,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        ts_rainbow = false,
        which_key = true,
        window_picker = true,
      },
    },
  },
  
  -- Disabled themes
  { "rebelot/kanagawa.nvim", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "f4z3r/gruvbox-material.nvim", name = "gruvbox-material", enabled = false },
  { "AstroNvim/astrotheme", enabled = false },
  { "scottmckendry/cyberdream.nvim", enabled = false },
  { "loctvl842/monokai-pro.nvim", enabled = false },
  
  -- Transparent background
  { "xiyaowong/transparent.nvim", enabled = false },
}
