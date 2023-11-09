return {
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim"
        },
        config = function()
            local lsp = require("lspconfig")
            lsp.rust_analyzer.setup {
                settings = {
                    diagnostics = {
                        enable = true
                    }
                }
            }
        end
    },

    -- mason.nvim
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end
    }
}
