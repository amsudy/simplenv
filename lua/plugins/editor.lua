return {
    -- wich-key.nvim
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
        }
    },

    -- lualine.nvim
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            { "catppuccin/nvim", name = "catppuccin" }
        },
        opts = function()
            local op = {
                options = {
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard" } },
                }
            }
            local coln = vim.g.colors_name:find("catppuccin")
            if coln then
                op.options.theme = "catppuccin"
            end
            return op
        end,
    },

    -- neo-tree.nvim
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        event = "VimEnter",
        keys = {
            { "<leader>e", "<cmd>Neotree float toggle<cr>", desc = "File explor" }
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        },
        opts = {
            filesystem = {
                -- bind_to_cwd = false,
                -- follow_current_file = { enabled = true },
                -- use_libuv_file_watcher = true,
            },
            window = {
                position = "float",
                mappings = {
                    ["<space>"] = "none",
                },
            },
            popup_border_style = "rounded",
        }
    },

    -- bufferline.nvim
    {
        "akinsho/bufferline.nvim",
        -- event = "VimEnter",
        event = "VeryLazy",
        keys = {
            { "<leader>bp", "<cmd>BufferLinePick<cr>",        desc = "Pick buffer" },
            { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close others buffer" },
            { "<leader>bd", "<cmd>bdelete<cr>",               desc = "Delete current buffer" },
            { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",   desc = "Delete current buffer" },
            { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",   desc = "Delete current buffer" },
        },
        opts = function()
            local op = {
                options = {
                    diagnostics = "nvim_lsp",
                    always_show_bufferline = false,
                },
            }

            -- if catppuccin is enable change to it
            local ok, bl = pcall(require, "catppuccin.groups.integrations.bufferline")
            local coln = vim.g.colors_name:find("catppuccin")
            if ok and coln then
                op["highlights"] = bl.get()
            end

            return op
        end,
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- telescope.nvim
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/noice.nvim",
            "rcarriga/nvim-notify",
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Find word" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Find buffers" },
        },
        config = function()
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("notify")
            require("telescope").load_extension("noice")
            require('telescope').load_extension('projects')
        end
    },

    -- telescope-fzf-native.nvim
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- build = 'make'
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },

    -- trouble.nvim
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        keys = {
            { "<leader>x", "<cmd>TroubleToggle<cr>", desc = "Trouble" },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    -- nvim-notify
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            vim.notify = require("notify")
        end
    },

    -- noice.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        cmd = "Noice",
        keys = {
            { "<leader>n", "<cmd>Noice<cr>", desc = "Noice" },
        },
        opts = {
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            }
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    -- dressing.nvim
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- mini.cursorword
    -- {
    --     "echasnovski/mini.cursorword",
    --     event = "VeryLazy",
    --     config = true
    -- },

    -- vim-illuminate
    {
        "RRethy/vim-illuminate",
        event = "BufReadPre",
    },

    -- windows.nvim
    {
        "anuvyklack/windows.nvim",
        event = "VeryLazy",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        keys = {
            { "<C-h>", "<C-w>h<cr>", desc = "h window" },
            { "<C-j>", "<C-w>j<cr>", desc = "j window" },
            { "<C-k>", "<C-w>k<cr>", desc = "k window" },
            { "<C-l>", "<C-w>l<cr>", desc = "l window" },
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    },

    -- flash.nvim
    {
        "folke/flash.nvim",
        opts = {},
        keys = {
            { "s", function() require("flash").jump() end,       mode = { "n", "o", "x" }, desc = "Flash" },
            { "S", function() require("flash").treesitter() end, mode = { "n", "o", "x" }, desc = "Flash treesitter" },
        }
    },

    -- dashboard-nvim
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = "doom",
                config = {
                    center = {
                        { action = "Telescope projects", desc = " Projects", icon = " ", key = "p" },
                        { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
                        { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
                        { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
                        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                        { action = "qa", desc = " Quit", icon = " ", key = "q" },
                    },
                }
            }
        end,
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
        }
    }
}

