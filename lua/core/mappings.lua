-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return function()
  local mappings = require("astrocore").empty_map_table()

  -------------------------------------------
  ------- Disable default mappings ----------
  -------------------------------------------
  mappings.n["<C-H>"] = false
  mappings.n["<C-L>"] = false
  mappings.n["<C-K>"] = false
  mappings.n["<C-J>"] = false
  mappings.n["<C-Left>"] = false
  mappings.n["<C-Right>"] = false
  mappings.n["<C-Up>"] = false
  mappings.n["<C-Down>"] = false

  mappings.n["<z-b>"] = false

  -------------------------------------------
  ----------- Utility functions -------------
  -------------------------------------------
  mappings.n["<C-z>"] = { "u", desc = "Undo" }
  mappings.i["<C-z>"] = { "<C-o>u", desc = "Undo" }
  mappings.i["<C-Del>"] = { "<C-o>dw", desc = "Delete a word backward" }
  mappings.i["<C-s>"] = { "<Cmd>w!<CR>", desc = "Save file" }
  mappings.i["jj"] = { "<Esc>", desc = "Normal mode" }

  mappings.i["<S-Tab>"] = { "<C-d>", desc = "Unindent line" }
  mappings.v["<Tab>"] = { ">gv", desc = "Indent line" }
  mappings.v["<S-Tab>"] = { "<gv", desc = "Unindent line" }
  mappings.v["K"] = { "<Nop>", desc = "Ignore error when hover on visual" }

  ------ Motions related to jumping or selecting ------
  mappings.n["<C-a>"] = { "ggVG", desc = "Select all lines" }

  ------ My customs keybinding ------
  mappings.n["<leader>xn"] = { "<Cmd>Telescope notify<CR>", desc = "Notifications" }

  return mappings
end
