return {
    {
        "shaunsingh/nord.nvim",
        -- lazy = false,
        -- config = function()
        -- 	vim.g.nord_borders = true
        -- 	vim.g.nord_cursorline_transparent = true
        -- 	vim.g.nord_italic = false

        --     vim.cmd [[colorscheme nord]]
        -- end
    },
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        -- config = function()
        --     vim.cmd [[colorscheme tokyonight]]
        -- end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = false,
                treesitter = true,
                treesitter_context = true,
                notify = true,
                mini = {
                    enabled = true,
                    indentscope_color = "sapphire",
                },
                dashboard = true,
                dropbar = {
                    enabled = true,
                    color_mode = true,
                },
                headlines = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                    colored_indent_levels = true,
                },
                markdown = true,
                mason = true,
                neotree = true,
                neogit = true,
                neotest = true,
                noice = true,
                dap = {
                    enabled = true,
                    enable_ui = true, -- enable nvim-dap-ui
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                semantic_tokens = true,
                symbols_outline = true,
                telescope = {
                    enabled = true,
                    -- style = "nvchad"
                },
                lsp_trouble = true,
                illuminate = {
                    enabled = true,
                    lsp = true,
                },
                which_key = true
            }
        },
        -- lazy = false,
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd [[colorscheme catppuccin-frappe]]
        end
    }
}

