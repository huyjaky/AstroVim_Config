return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup {
      enabled = false, -- your config here
    }
  end,
}
