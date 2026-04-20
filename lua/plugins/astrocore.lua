-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = false, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = false, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    sessions = {
      -- Configure auto saving
      autosave = {
        last = false, -- auto save last session
        cwd = false, -- auto save session for each working directory
      },
      -- Patterns to ignore when saving sessions
      ignore = {
        dirs = {}, -- working directories to ignore sessions in
        filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
        buftypes = {}, -- buffer types to ignore sessions
      },
    },
    -- vim options can be configured here
    options = {
      opt = {
        number = true, -- show line number
        relativenumber = true, -- show relative line number
        spell = false, -- disable spell check
        wrap = false, -- disable auto wrap lines
        signcolumn = "yes", -- show changes of file
        foldcolumn = "1", -- show foldcolumn
        foldenable = true, -- enable fold for nvim-ufo
        foldlevel = 99, -- set high foldlevel for nvim-ufo
        foldlevelstart = 99, -- start with all code unfolded
        guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20", -- default cursor setting
        clipboard = "unnamedplus", -- enable system clipboard
        termguicolors = true, -- true color support
        mouse = "a", -- enable mouse
        mousemoveevent = true, -- enable mousemove event
        laststatus = 3, -- only show one statusline
        swapfile = false, -- don't use swapfile
        shiftwidth = 2, -- number of space inserted for indentation; when zero the 'tabstop' value will be used
        tabstop = 2, -- set the number of space in a tab to 4
        softtabstop = 2, -- can be differnt from tabstop
        showtabline = 0, -- always show tabline
        expandtab = false, -- use spaces instead of tab
        undofile = true, -- enable persistent undo
      },
      g = {
        copilot_no_tab_map = true,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      n = {
        ["<C-H>"] = false,
        ["<C-L>"] = false,
        ["<C-K>"] = false,
        ["<C-J>"] = false,

        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-k>"] = false,
        ["<C-j>"] = false,

        ["<C-Left>"] = false,
        ["<C-Right>"] = false,
        ["<C-Up>"] = false,
        ["<C-Down>"] = false,
        ["<z-b>"] = false,

        ["<C-z>"] = { "u", desc = "Undo" },
        ["<C-a>"] = { "ggVG", desc = "Select all lines" },
        ["<leader>xn"] = { "<Cmd>Telescope notify<CR>", desc = "Notifications" },
      },
      i = {
        ["<C-z>"] = { "<C-o>u", desc = "Undo" },
        ["<C-Del>"] = { "<C-o>dw", desc = "Delete a word backward" },
        ["<C-s>"] = { "<Cmd>w!<CR>", desc = "Save file" },
        ["jj"] = { "<Esc>", desc = "Normal mode" },
        ["<S-Tab>"] = { "<C-d>", desc = "Unindent line" },
      },
      v = {
        ["<Tab>"] = { ">gv", desc = "Indent line" },
        ["<S-Tab>"] = { "<gv", desc = "Unindent line" },
        ["K"] = { "<Nop>", desc = "Ignore error when hover on visual" },
      },
    },
    autocmds = {
      disable_comment_newline = {
        {
          event = "BufEnter",
          desc = "Disable auto insert comment newline",
          command = "set formatoptions-=cro",
        },
      },
      auto_wrap = {
        {
          event = "FileType",
          desc = "Enable wrap and spell for text like documents",
          pattern = { "gitcommit", "markdown", "text", "plaintext" },
          callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
          end,
        },
        {
          event = "FileType",
          pattern = "markdown",
          callback = function() vim.opt_local.spell = false end,
        },
      },
      disable_suspend_with_c_z = {
        {
          event = "BufEnter",
          desc = "Remap <C-z> to nothing so that it doesn't suspend terminal",
          command = "nnoremap <c-z> <nop>",
        },
      },
      clear_last_search = {
        {
          event = "BufWinEnter",
          desc = "Clear last search pattern",
          pattern = "*",
          command = "let @/ = ''",
        },
      },
      custom_highlights = {
        {
          event = "ColorScheme",
          desc = "Custom Highlight Groups",
          callback = function()
            vim.api.nvim_set_hl(0, "Identifier", { fg = "#55ffff" })
            vim.api.nvim_set_hl(0, "TreesitterContext", { underline = true, sp = "Red", bg = "#1e1e3f" })
          end,
        },
      },
    },
  },
}
