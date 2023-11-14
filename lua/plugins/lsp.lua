return {
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        -- event = "LspAttach",
        event = "VeryLazy",
        dependencies = {
            -- { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim", opts = {} },
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
            })
            require("mason-lspconfig").setup_handlers {
                function(sn)
                    require("lspconfig")[sn].setup {
                        capabilities = capabilities,
                    }
                end,
            }
        end
    },
}

