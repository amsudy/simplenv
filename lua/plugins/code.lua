return {
	-- indent-blankline.nvim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufEnter" },
		opts = {
			scope = {
				enabled = false,
			},
			exclude = {
				filetypes = {
					"lazy",
				},
			},
		},
		main = "ibl",
	},

	-- mini.indentscope
	{
		"echasnovski/mini.indentscope",
		event = { "Bufenter" },
		opts = {
			symbol = "▎",
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	-- mini.comment
	{
		"echasnovski/mini.comment",
		event = "BufEnter",
		opts = {},
	},

	-- mini.surround
	{
		"echasnovski/mini.surround",
		event = "BufEnter",
		opts = {},
	},

	-- mini.pairs
	{
		"echasnovski/mini.pairs",
		event = "BufEnter",
		opts = {},
	},

	-- luasnip
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},

	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{ "saadparwaiz1/cmp_luasnip", dependencies = "L3MON4D3/LuaSnip" },
		},
		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local defaults = require("cmp.config.default")()
			local function has_words_before()
				if vim.bo.buftype == "prompt" then
					return false
				end
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                -- stylua: ignore
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
			end
			return {
				preselect = cmp.PreselectMode.None,
				sorting = defaults.sorting,
				experimental = {
					ghost_text = {
						hl_group = "Comment",
					},
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 50 },
					{ name = "path", priority = 40 },
					{ name = "luasnip", priority = 30 },
				}, {
					{ name = "buffer", priority = 50, keyword_length = 3 },
				}),
				mapping = cmp.mapping.preset.insert({
					-- <CR> accepts currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({
							select = true,
							behavior = cmp.ConfirmBehavior.Replace,
						}),
						-- Do not set command mode, it will interfere with noice popmenu.
					}),
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-space>"] = cmp.mapping.complete(),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-c>"] = function(fallback)
						cmp.close()
						fallback()
					end,
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.jumpable(1) then
							luasnip.jump(1)
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
			}
		end,
	},
}
