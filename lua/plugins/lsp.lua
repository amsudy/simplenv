return {
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        -- event = "LspAttach",
        event = "VeryLazy",
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
        lazy = false,
        keys = {
            { "<leader>dc", function() require("dap").continue() end,          desc = "Debug continue" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug breakpoint" },
            { "<leader>ds", function() require("dap").dap_stopped() end,       desc = "Debug stop" },
        },
        config = function()
            -- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
            -- local codelldb_path = extension_path .. 'adapter/codelldb'
            -- local liblldb_path = extension_path .. 'lldb/lib/liblldb'
            -- local this_os = vim.loop.os_uname().sysname;
            -- local detached = true
            -- if this_os:find "Windows" then
            --     detached = false
            --     codelldb_path = extension_path .. "adapter\\codelldb.exe"
            --     liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
            -- else
            --     liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
            -- end
            -- local dap = require("dap")
            -- dap.adapters.codelldb = {
            --     type = "server",
            --     port = "${port}",
            --     executable = {
            --         command = codelldb_path,
            --         args = { "--port", "${port}" },
            --         detached = detached,
            --     }
            -- }
            -- dap.configurations.rust = {
            --     {
            --         name = "Drust",
            --         type = "codelldb",
            --         request = "launch",
            --         program = "${file}",
            --         cwd = "${workspaceFolder}",
            --         stopOnEntry = false,
            --     }
            -- }
        end
    },

    -- nvim-dap-ui
    {
        "rcarriga/nvim-dap-ui",
        -- event = "VeryLazy",
        dependencies = {
            { "mfussenegger/nvim-dap" },
            { "theHamsta/nvim-dap-virtual-text" },
        },
        keys = {
            { "<leader>do", function() require("dapui").toggle() end, desc = "Debug ui" },
        },
        -- config = function()
        --     require("dapui").setup()
        -- end
        config = true
    },
}

