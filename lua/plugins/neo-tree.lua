-- File Explorer and File Management
return {
  -- Neo-tree file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      source_selector = {
        winbar = false,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {},
          never_show = {},
          never_show_by_pattern = {
            "*.zip",
            "*.rar",
          },
        },
      },
      window = {
        mappings = {
          ["K"] = false,
          ["H"] = false,
        },
      },
      enable_git_status = false,
      enable_diagnostics = false,
      git_status_async = false,
    },
  },
  
  -- Disabled file explorer plugins
  { "s1n7ax/nvim-window-picker", enabled = false },
}

