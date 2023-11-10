return {
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
						}
                    end
                }
            })
        end
    },
}
