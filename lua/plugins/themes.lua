return {
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
}
