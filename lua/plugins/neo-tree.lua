-- NOTE: always show hidden files and dot files
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
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          -- '.zip',
          -- '.rar',
          -- '.pdf',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},

        never_show_by_pattern = { -- uses glob style patterns
          '*.zip',
          '*.rar',
          '*.pdf',
        },
      },
    },
    enable_git_status = false,
    enable_diagnostics = false,
    git_status_async = false,
  },
}
