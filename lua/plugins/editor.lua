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
                always_show_bufferline = false,
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
		end
    },

	-- telescope-fzf-native.nvim
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	}
}
