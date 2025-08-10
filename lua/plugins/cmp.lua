local function has_words_before()
	local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	{
		"github/copilot.vim",
		event = "BufRead",
		config = function()
			vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("\\<CR>")', { expr = true, silent = true })
		end,
	},
	-- { "hrsh7th/cmp-buffer", event = "BufRead" },
	-- { "hrsh7th/cmp-path", event = "BufRead" },
	{
		"onsails/lspkind.nvim",
		opts = {
			symbol_map = require("plugins.configs.ui.lspkind"),
		},
	},
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter", "BufEnter" },
		version = "^1",
		opts_extend = { "sources.default", "cmdline.sources", "term.sources" },
		opts = {
			-- remember to enable your providers here
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			keymap = {
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-N>"] = { "select_next", "show" },
				["<C-P>"] = { "select_prev", "show" },
				["<C-J>"] = { "select_next", "fallback" },
				["<C-K>"] = { "select_prev", "fallback" },
				["<C-U>"] = { "scroll_documentation_up", "fallback" },
				["<C-D>"] = { "scroll_documentation_down", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-f>"] = false,

				-- vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("\\<CR>")', { expr = true, silent = true }),

				["<Tab>"] = {
					"select_next",
					"snippet_forward",
					function(cmp)
						if has_words_before() or vim.api.nvim_get_mode().mode == "c" then
							return cmp.show()
						end
					end,
					"fallback",
				},
				["<S-Tab>"] = {
					"select_prev",
					"snippet_backward",
					function(cmp)
						if vim.api.nvim_get_mode().mode == "c" then
							return cmp.show()
						end
					end,
					"fallback",
				},
			},
			completion = {
				list = { selection = { preselect = true, auto_insert = false } },
				ghost_text = {
					enabled = false,
				},
				menu = {
					auto_show = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon", "label", gap = 1 },
							{ "kind" },
						},
						components = {
							kind = {
								-- (optional) use highlights from mini.icons
								highlight = function(ctx)
									local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
									return hl
								end,
							},
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,
							},
						},
					},
				},
				accept = {
					auto_brackets = { enabled = true },
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					window = {
						border = "rounded",
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					},
				},
			},
			signature = {
				window = {
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
				},
			},
		},
		specs = {
			{
				"L3MON4D3/LuaSnip",
				optional = true,
				specs = { { "Saghen/blink.cmp", opts = { snippets = { preset = "luasnip" } } } },
			},
			{
				"AstroNvim/astrolsp",
				optional = true,
				opts = function(_, opts)
					opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)

					-- disable AstroLSP signature help if `blink.cmp` is providing it
					local blink_opts = require("astrocore").plugin_opts("blink.cmp")
					if vim.tbl_get(blink_opts, "signature", "enabled") == true then
						if not opts.features then
							opts.features = {}
						end
						opts.features.signature_help = false
					end
				end,
			},
			{
				"folke/lazydev.nvim",
				optional = true,
				specs = {
					{
						"Saghen/blink.cmp",
						opts = function(_, opts)
							if pcall(require, "lazydev.integrations.blink") then
								return require("astrocore").extend_tbl(opts, {
									sources = {
										-- add lazydev to your completion providers
										default = { "lazydev" },
										providers = {
											lazydev = {
												name = "LazyDev",
												module = "lazydev.integrations.blink",
												score_offset = 100,
											},
										},
									},
								})
							end
						end,
					},
				},
			},
			-- disable built in completion plugins
			-- { "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
		},
	},
}
