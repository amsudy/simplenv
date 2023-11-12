return {
	-- neodev.nvim
	{
		"folke/neodev.nvim",
		event = "VeryLazy",
		opts = {
			debug = true,
			library = {
				runtime = "~/projects/neovim/runtime/",
			},
		},
	},
    
    -- lsp-format.nvim
    {
        "lukas-reineke/lsp-format.nvim",
        event = "VeryLazy",
        cmd = "Format",
        opts = {},
    },

    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

        },
        config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                },
                handlers = {
                    function(sn)
                        require("lspconfig")[sn].setup {
							capabilities = capabilities,
                            on_attach = require("lsp-format").on_attach,
						}
                    end
                }
            })
        end
    },
}
