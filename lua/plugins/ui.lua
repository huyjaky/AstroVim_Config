-- UI and Interface Enhancements
return {
	-- Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = function(_, opts)
			opts.section.header.val = require("plugins.configs.ui.alpha")[10]
			opts.section.buttons.val = {}
		end,
	},

	-- Status line
	{
		"rebelot/heirline.nvim",
		opts = function(_, opts)
			opts.statusline = require("plugins.configs.ui.heirline").statusline
			opts.winbar = require("plugins.configs.ui.heirline").winbar
		end,
	},

	-- Notifications
	{
		"rcarriga/nvim-notify",
		opts = function(_, opts)
			opts.background_colour = "#000000"
			opts.timeout = 2000
			opts.fps = 60
			opts.render = "compact"
			opts.top_down = false
		end,
	},

	-- Todo comments highlighting
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				},
				TODO = { icon = " ", color = "info" },
				GOAL = { icon = " ", color = "info", alt = { "GOALS", "TARGETS", "FIXED" } },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
		},
	},

	-- Smart bracket pairing
	{
		"altermo/ultimate-autopair.nvim",
		event = "InsertEnter",
		branch = "v0.6",
		opts = {
			cmap = false,
			extensions = {
				cond = {
					cond = {
						function(fn)
							return not fn.in_node("comment")
						end,
					},
				},
				fly = {
					nofilter = true,
				},
			},
			config_internal_pairs = {
				{ '"', '"', fly = true },
				{ "'", "'", fly = true },
				{ "[", "]", fly = true },
				{ "{", "}", fly = true },
				{ "(", ")", fly = true },
			},
		},
		dependencies = {
			{
				"AstroNvim/astrocore",
				opts = {
					mappings = {
						n = {
							["<Leader>ua"] = {
								desc = "Toggle Ultimate Autopair",
								function()
									local notify = require("astrocore").notify
									local function bool2str(bool)
										return bool and "on" or "off"
									end
									local ok, ultimate_autopair = pcall(require, "ultimate-autopair")
									if ok then
										ultimate_autopair.toggle()
										vim.g.ultimate_autopair_enabled = require("ultimate-autopair.core").disable
										notify(
											string.format(
												"ultimate-autopair %s",
												bool2str(not vim.g.ultimate_autopair_enabled)
											)
										)
									else
										notify("ultimate-autopair not available")
									end
								end,
							},
						},
					},
				},
			},
		},
		specs = {
			{
				"windwp/nvim-autopairs",
				optional = true,
				enabled = false,
			},
		},
	},

	-- Treesitter context
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "User AstroFile",
		cmd = { "TSContext" },
		opts = {
			on_attach = function()
				vim.api.nvim_set_hl(0, "TreesitterContext", { underline = true, sp = "Red", bg = "#1e1e3f" })
			end,
			max_lines = 2,
		},
		dependencies = {
			"AstroNvim/astrocore",
			opts = {
				mappings = {
					n = {
						["<Leader>uT"] = {
							"<cmd>TSContext toggle<CR>",
							desc = "Toggle treesitter context",
						},
					},
				},
			},
		},
	},

	-- Virtual text context
	{
		"andersevenrud/nvim_context_vt",
		event = "User AstroFile",
		cmd = { "NvimContextVtToggle" },
		dependencies = {
			"AstroNvim/astrocore",
			opts = {
				mappings = {
					n = {
						["<Leader>uv"] = {
							function()
								require("nvim_context_vt").toggle()
							end,
							desc = "Toggle virutal text context",
						},
					},
				},
			},
		},
	},

	-- Noice UI
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("noice").setup({
				views = {},
				messages = {
					enabled = false,
				},
				notify = {
					enabled = false,
				},
				        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          progress = {
            enabled = false, -- Disable LSP progress
          },
					hover = {
						enabled = true,
						silent = true,
						view = nil,
						opts = {
							border = {
								style = "rounded",
								text = { top = " Documents ", top_align = "center" },
							},
							win_options = {
								wrap = true,
								linebreak = true,
							},
							buf_options = {
								filetype = "markdown",
							},
						},
					},
					signature = {
						enabled = false,
					},
					message = {
						enabled = false,
					},
				},
				markdown = {},
				presets = {
					bottom_search = false,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
				routes = {
					{
						filter = { event = "msg_show", kind = "", find = "written" },
						opts = { skip = true },
					},
					{
						filter = { event = "msg_show", find = "^%d+ more lines" },
						opts = { skip = true },
					},
					{
						filter = { event = "msg_show", find = "^%d+ fewer lines" },
						opts = { skip = true },
					},
					{
						filter = { event = "msg_show", find = "^%d+ lines yanked$" },
						opts = { skip = true },
					},
					{
						filter = { event = "msg_show", find = "^%d+ lines moved$" },
					},
				},
			})
		end,
		specs = {
			{
				"nvim-treesitter/nvim-treesitter",
				opts = function(_, opts)
					if opts.ensure_installed ~= "all" then
						opts.ensure_installed = require("astrocore").list_insert_unique(
							opts.ensure_installed,
							{ "bash", "markdown", "markdown_inline", "regex", "vim", "latex", "bibtex" }
						)
					end
				end,
			},
			{
				"AstroNvim/astrolsp",
				optional = true,
				opts = function(_, opts)
					-- No need to manage lsp_handlers as noice is not handling them now
				end,
			},
			
			{
				"folke/edgy.nvim",
				optional = true,
				opts = function(_, opts)
					if not opts.bottom then
						opts.bottom = {}
					end
					table.insert(opts.bottom, {
						ft = "noice",
						size = { height = 0.4 },
						filter = function(_, win)
							return vim.api.nvim_win_get_config(win).relative == ""
						end,
					})
				end,
			},
		},
	},

	-- Disabled UI plugins
	{ "s1n7ax/nvim-window-picker", enabled = false },
	{ "NvChad/nvim-colorizer.lua", enabled = false },
	{ "iamcco/markdown-preview.nvim", enabled = false },
}
