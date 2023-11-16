return {
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        -- event = "VeryLazy",
        event = "FileType",
        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", config = true, dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim",  opts = {} },
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- dap
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("mason").setup()
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb" },
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end
                }
            })
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "jsonls",
                    "rust_analyzer",
                    "svelte",
                    "taplo",
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

    -- dap
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<leader>dc", function() require("dap").continue() end,          desc = "Debug continue" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug breakpoint" },
            { "<leader>ds", function() require("dap").dap_stopped() end,       desc = "Debug stop" },
        },
    },

    -- nvim-dap-ui
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            { "mfussenegger/nvim-dap" },
            { "theHamsta/nvim-dap-virtual-text" },
        },
        keys = {
            { "<leader>do", function() require("dapui").toggle() end, desc = "Debug ui" },
        },
        config = true
    },
}

