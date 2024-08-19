return {
  "williamboman/mason.nvim",
  opts = function()
    require("mason").setup {
      ui = {
        ---@since 1.0.0
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        ---@since 1.0.0
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "single",

        ---@since 1.0.0
        -- Width of the window. Accepts:
        -- - Integer greater than 1 for fixed width.
        -- - Float in the range of 0-1 for a percentage of screen width.
        width = 0.8,

        ---@since 1.0.0
        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.9,

        icons = {
          ---@since 1.0.0
          -- The list icon to use for installed packages.
          package_installed = "  ",
          ---@since 1.0.0
          -- The list icon to use for packages that are installing, or queued for installation.
          package_pending = "  ",
          ---@since 1.0.0
          -- The list icon to use for packages that are not installed.
          package_uninstalled = "  ",
        },
      },
    }
  end,
}
