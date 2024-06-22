return {
  "fedepujol/move.nvim",
  opts = {
    noremap = true,
    silent = true,
  },
  keys = {
    -- Normal-mode commands
    { "<A-j>", ":MoveLine(1)<CR>", mode = "n", desc = "Move line down" },
    { "<A-k>", ":MoveLine(-1)<CR>", mode = "n", desc = "Move line up" },
    { "<A-h>", ":MoveHChar(-1)<CR>", mode = "n", desc = "Move character left" },
    { "<A-l>", ":MoveHChar(1)<CR>", mode = "n", desc = "Move character right" },
    { "<leader>wf", ":MoveWord(1)<CR>", mode = "n", desc = "Move word forward" },
    { "<leader>wb", ":MoveWord(-1)<CR>", mode = "n", desc = "Move word backward" },

    -- Visual-mode commands
    { "<A-j>", ":MoveBlock(1)<CR>", mode = "v", desc = "Move block down" },
    { "<A-k>", ":MoveBlock(-1)<CR>", mode = "v", desc = "Move block up" },
    { "<A-h>", ":MoveHBlock(-1)<CR>", mode = "v", desc = "Move block left" },
    { "<A-l>", ":MoveHBlock(1)<CR>", mode = "v", desc = "Move block right" },
  },
}
