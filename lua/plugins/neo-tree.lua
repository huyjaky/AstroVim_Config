return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = false,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false, -- always show dotfiles
        hide_gitignored = false, -- always show gitignored
        hide_by_name = {},
        never_show = {},
        never_show_by_pattern = { -- uses glob style patterns
          "*.zip",
          "*.rar",
          -- "*.pdf",
        },
      },
    },
    window = {
      mappings = {
        ["K"] = false, -- disable Shift+k
        ["H"] = false, -- disable Shift+k
      },
    },
    enable_git_status = false,
    enable_diagnostics = false,
    git_status_async = false,
  },
}
