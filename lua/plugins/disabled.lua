-- Plugins to disable
return {
	{ "s1n7ax/nvim-window-picker", enabled = false },
	{ "akinsho/toggleterm.nvim", enabled = false },
	{ "NvChad/nvim-colorizer.lua", enabled = false },
	{ "catppuccin/nvim", name = "catppuccin", enabled = false },
	{ "rebelot/kanagawa.nvim", enabled = false },
	{ "folke/tokyonight.nvim", enabled = false },
	{ "f4z3r/gruvbox-material.nvim", name = "gruvbox-material", enabled = false },
	{ "b0o/SchemaStore.nvim", enabled = false },
	{ "ray-x/lsp_signature.nvim", enabled = false },
	{ "kmontocam/nvim-conda", enabled = false },
	{ "NMAC427/guess-indent.nvim", enabled = false },
	{ "lukas-reineke/indent-blankline.nvim", enabled = false },
	{ "AstroNvim/astrotheme", enabled = false },
	{ "scottmckendry/cyberdream.nvim", enabled = false },
	{ "xiyaowong/transparent.nvim", enabled = false },
	{ "loctvl842/monokai-pro.nvim", enabled = false },
	{ "xiyaowong/transparent.nvim", enabled = false },
	{ "iamcco/markdown-preview.nvim", enabled = false },
	{ "max397574/better-escape.nvim", enabled = false },
	{ "hinell/duplicate.nvim", enabled = false },
	{ "CRAG666/code_runner.nvim", enabled = false },
	{ "RRethy/vim-illuminate", enabled = false },
	-- { "OXY2DEV/markview.nvim",                       enabled = false },
	{ "kevinhwang91/nvim-ufo", enabled = false },
	{ "echasnovski/mini.bufremove", enabled = false },

	{ "hrsh7th/nvim-cmp", enabled = false },
	{ "rcarriga/cmp-dap", enabled = false },

	-- System
	{ "nvim-treesitter/nvim-treesitter-textobjects", enabled = false },
	-- Disable Dap
	{ "mfussenegger/nvim-dap", enabled = false },
	{ "theHamsta/nvim-dap-virtual-text", enabled = false },
	{ "rcarriga/nvim-dap-ui", enabled = false },
	{ "jay-babu/mason-nvim-dap.nvim", enabled = false },
	-- { "jay-babu/mason-null-ls.nvim",                 enabled = false },
	{ "b0o/schemastore.nvim", enabled = false },
	{ "Wansmer/treesj", enabled = false },

	-- interface
	-- { "HiPhish/rainbow-delimiters.nvim", enabled = true },
	{ "ribru17/bamboo.nvim", enabled = true },

	-- service
	{ "stevearc/resession.nvim", enabled = true },
	{ "echasnovski/mini.move", enabled = true },
	{ "nvim-neo-tree/neo-tree.nvim", enabled = true },
	{ "folke/flash.nvim", enabled = true },
	{ "github/copilot.vim", enabled = true },

	{ "rafamadriz/friendly-snippets", enabled = false },
	{ "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
	{ "windwp/nvim-ts-autotag", enabled = false },
	{ "saadparwaiz1/cmp_luasnip", enabled = false },
	{ "L3MON4D3/LuaSnip", enabled = true },
}

-- if true then return {} end
