return {
  indent = {
    priority = 1,
    enabled = false, -- enable indent guides
    only_scope = false, -- only show indent guides of the scope
    only_current = false, -- only show indent guides in the current window
    char = " ",
    hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
  },

  animate = {
    enabled = vim.fn.has("nvim-0.10") == 1,
    style = "up_down",
    easing = "linear",
    duration = {
      step = 10, -- ms per step
      total = 100, -- maximum duration
    },
  },
  scope = {
    enabled = true, -- enable highlighting the current scope
    priority = 200,
    char = "",
    underline = false, -- underline the start of the scope
    only_current = false, -- only show scope in the current window
    hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
  },
  chunk = {
    enabled = false,
    char = {
      corner_top = "┏",
      corner_bottom = "┗",
      horizontal = "━",
      vertical = "┃",
      arrow = "▶",
    },
  }
}
