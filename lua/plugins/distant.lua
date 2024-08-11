if true then return {} end

-- NOTE: control remote pc 

return {
  "chipsenkbeil/distant.nvim",
  branch = "v0.3",
  event = "VimEnter",
  cmd = {
    "DistantLaunch",
    "DistantOpen",
    "DistantConnect",
    "DistantInstall",
    "DistantMetadata",
    "DistantShell",
    "DistantShell",
    "DistantSystemInfo",
    "DistantClientVersion",
    "DistantSessionInfo",
    "DistantCopy",
  },
  config = function() require("distant"):setup() end,
}