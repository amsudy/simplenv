return {
    -- lualine.nvim
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        opts = {
            options = {
                globalstatus = true,
            },
        },
    },

    -- neo-tree.nvim
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        event = "VimEnter",
	keys = {
		{"<leader>e", "<cmd>Neotree float toggle<cr>", desc = "File explor"}
	},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        },
        opts = {
            window = {
                position = "float",
				mappings = {
                    ["<space>"] = "none",
                },
            },
        }
    },

    -- bufferline.nvim
    {
        "akinsho/bufferline.nvim",
        event = "VimEnter",
		keys = {
			{"<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer"},
			{"<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close others buffer"},
			{"<leader>bd", "<cmd>bdelete<cr>", desc = "Delete current buffer"},
			{"<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Delete current buffer"},
			{"<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Delete current buffer"},
		},
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                -- always_show_bufferline = false,
            }
        },
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- telescope.nvim
    {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files"},
			{"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find word"},
			{"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers"},
		},
		config = function ()
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("notify")
			require("telescope").load_extension("noice")
		end
    },

	-- telescope-fzf-native.nvim
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		-- build = 'cmake'
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
	},

	-- trouble.nvim
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		keys = {
			{"<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble"},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	-- nvim-notify 
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function ()
			vim.notify = require("notify")
		end
	},

	-- noice.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		cmd = "Noice",
		keys = {
			{"<leader>nn", "<cmd>Noice<cr>", desc = "Noice"},
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
}
