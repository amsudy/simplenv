return {
    -- indent-blankline.nvim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = {"BufEnter"},
        opts = {
            scope = {
                enabled = false,
            }
        },
        main = "ibl",
    },

    -- mini.indentscope
    {
        "echasnovski/mini.indentscope",
        event = {"Bufenter"},
        opts = {
            symbol = "│"
        }
    },

    -- mini.comment
    {
        "echasnovski/mini.comment",
        event = "BufEnter",
        opts = {}
    },

    -- mini.surround
    {
        "echasnovski/mini.surround",
        event = "BufEnter",
        opts = {}
    },

    -- mini.pairs
    {
        "echasnovski/mini.pairs",
        event = "BufEnter",
        opts = {}
    },

	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function ()
			require("cmp").setup({
				sources = require("cmp").config.sources({
					{ name = "nvim_lsp" },
					-- { name = "nvim_lsp_signature_help" },
					-- { name = "nvim_lua" },
					-- { name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer", keyword_length = 3 },
				}),
			})
		end
	}
}
