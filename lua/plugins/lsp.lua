return {
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
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
                automatic_installation = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
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
                        on_attach = function(_, bufnr)
                            vim.lsp.inlay_hint.enable(bufnr, true)
                        end
                    }
                end,
            }
        end
    },

    -- lspsaga.nvim
    -- {
    --     'nvimdev/lspsaga.nvim',
    --     event = "FileType",
    --     config = function()
    --         require('lspsaga').setup({})
    --     end,
    --     dependencies = {
    --         'nvim-treesitter/nvim-treesitter',
    --         'nvim-tree/nvim-web-devicons'
    --     }
    -- },

    -- dap
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "jbyuki/one-small-step-for-vimkind"
        },
        keys = {
            { "<leader>dc", function() require("dap").continue() end,          desc = "Debug continue" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug breakpoint" },
            { "<leader>ds", function() require("dap").dap_stopped() end,       desc = "Debug stop" },
        },
        config = function()
            local dap = require("dap")
            dap.configurations.lua = {
                {
                    type = 'nlua',
                    request = 'attach',
                    name = "Attach to running Neovim instance",
                }
            }

            dap.adapters.nlua = function(callback, config)
                callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
            end
        end
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

