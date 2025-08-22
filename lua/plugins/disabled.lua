-- Disabled Plugins
return {
	-- Themes and Colorschemes
	{ "catppuccin/nvim", name = "catppuccin", enabled = false },
	{ "rebelot/kanagawa.nvim", enabled = false },
	{ "folke/tokyonight.nvim", enabled = false },
	{ "f4z3r/gruvbox-material.nvim", name = "gruvbox-material", enabled = false },
	{ "AstroNvim/astrotheme", enabled = false },
	{ "scottmckendry/cyberdream.nvim", enabled = false },
	{ "loctvl842/monokai-pro.nvim", enabled = false },
	{ "xiyaowong/transparent.nvim", enabled = false },

	-- UI and Interface
	{ "s1n7ax/nvim-window-picker", enabled = false },
	{ "NvChad/nvim-colorizer.lua", enabled = false },
	{ "iamcco/markdown-preview.nvim", enabled = false },
	{ "lukas-reineke/indent-blankline.nvim", enabled = false },
	{ "lazy/nvim-ufo", enabled = false },

	-- Editor Enhancements
	{ "max397574/better-escape.nvim", enabled = false },
	{ "hinell/duplicate.nvim", enabled = false },
	{ "CRAG666/code_runner.nvim", enabled = false },
	{ "RRethy/vim-illuminate", enabled = false },
	{ "echasnovski/mini.bufremove", enabled = false },
	{ "akinsho/toggleterm.nvim", enabled = false },

	-- Completion
	{ "hrsh7th/nvim-cmp", enabled = false },
	{ "hrsh7th/cmp-buffer", enabled = false },
	{ "hrsh7th/cmp-path", enabled = false },
	{ "hrsh7th/cmp-cmdline", enabled = false },
	{ "rcarriga/cmp-dap", enabled = false },
	{ "saadparwaiz1/cmp_luasnip", enabled = false },

	-- Development Tools
	{ "mfussenegger/nvim-dap", enabled = false },
	{ "theHamsta/nvim-dap-virtual-text", enabled = false },
	{ "rcarriga/nvim-dap-ui", enabled = false },
	{ "jay-babu/mason-nvim-dap.nvim", enabled = false },

	-- Motion and Navigation
	{ "Wansmer/treesj", enabled = false },

	-- System
	{ "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
	{ "b0o/schemastore.nvim", enabled = false },

	-- Formatting and Snippets
	{ "rafamadriz/friendly-snippets", enabled = false },
	{ "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
	{ "windwp/nvim-ts-autotag", enabled = false },

	-- Services
	{ "stevearc/resession.nvim", enabled = true },
	{ "echasnovski/mini.move", enabled = true },
	{ "nvim-neo-tree/neo-tree.nvim", enabled = true },
	{ "folke/flash.nvim", enabled = true },
	{ "github/copilot.vim", enabled = true },
	{ "L3MON4D3/LuaSnip", enabled = true },
}
