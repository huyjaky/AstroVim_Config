-- NOTE: always show hidden files and dot files
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    sources = {
      "filesystem",
      -- "buffers",
      -- "git_status",
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
    enable_git_status = false,
    enable_diagnostics = false,
    git_status_async = false,
  },
}
