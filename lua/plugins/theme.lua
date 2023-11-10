return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        config = function()
			vim.g.nord_borders = true
			vim.g.nord_cursorline_transparent = true
			vim.g.nord_italic = false

            vim.cmd [[colorscheme nord]]
        end
    },
    {
        "folke/tokyonight.nvim",
    },
    {
        "catppuccin/nvim",
        -- lazy = false,
        -- config = function ()
        --     vim.cmd[[colorscheme catppuccin]]
        -- end
    }
}
