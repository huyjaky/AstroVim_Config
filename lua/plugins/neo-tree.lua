-- File Explorer and File Management

-- List of file extensions that should be visible but cannot be opened
local blocked_exts = { "zip", "rar", "7z", "tar", "gz", "iso", "exe", "docx" }

local function prevent_open(node)
  if node.type == "file" and vim.tbl_contains(blocked_exts, node.ext) then
    vim.notify("Opening ." .. node.ext .. " files is not allowed!", vim.log.levels.WARN, { title = "Neo-tree" })
    return true
  end
  return false
end

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
          never_show_by_pattern = {},
        },
        commands = {
          open = function(state)
            if prevent_open(state.tree:get_node()) then return end
            require("neo-tree.sources.filesystem.commands").open(state)
          end,
          open_vsplit = function(state)
            if prevent_open(state.tree:get_node()) then return end
            require("neo-tree.sources.filesystem.commands").open_vsplit(state)
          end,
          open_split = function(state)
            if prevent_open(state.tree:get_node()) then return end
            require("neo-tree.sources.filesystem.commands").open_split(state)
          end,
          open_tabnew = function(state)
            if prevent_open(state.tree:get_node()) then return end
            require("neo-tree.sources.filesystem.commands").open_tabnew(state)
          end,
        },
      },
      window = {
        mappings = {
          ["K"] = false,
          ["H"] = false,
        },
        width = 50
      },
      enable_git_status = false,
      enable_diagnostics = true,
      git_status_async = false,
    },
  },
  
  -- Disabled file explorer plugins
}

