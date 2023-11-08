return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        config = function ()
            vim.cmd[[colorscheme nord]]
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
