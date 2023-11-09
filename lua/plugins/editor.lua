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
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        },
        opts = {
            window = {
                position = "float",
            },
        }
    },

    -- bufferline.nvim
    {
        "akinsho/bufferline.nvim",
        event = {"VimEnter"},
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                -- always_show_bufferline = false,
            }
        },
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
    }
}
