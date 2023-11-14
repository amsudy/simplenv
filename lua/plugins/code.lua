return {
    -- indent-blankline.nvim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufEnter" },
        opts = {
            scope = {
                enabled = false,
            },
            exclude = {
                filetypes = {
                    "lazy",
                },
            },
        },
        main = "ibl",
    },

    -- mini.indentscope
    {
        "echasnovski/mini.indentscope",
        event = { "Bufenter" },
        opts = {
            symbol = "▎",
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },

    -- mini.comment
    {
        "echasnovski/mini.comment",
        event = "BufEnter",
        opts = {},
    },

    -- mini.surround
    {
        "echasnovski/mini.surround",
        event = "BufEnter",
        opts = {},
    },

    -- mini.pairs
    {
        "echasnovski/mini.pairs",
        event = "BufEnter",
        opts = {},
    },

    -- luasnip
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            { "saadparwaiz1/cmp_luasnip", dependencies = "L3MON4D3/LuaSnip" },
        },
        opts = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local defaults = require("cmp.config.default")()
            local function has_words_before()
                if vim.bo.buftype == "prompt" then
                    return false
                end
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                -- stylua: ignore
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
            end
            return {
                -- preselect = cmp.PreselectMode.None,
                sorting = defaults.sorting,
                experimental = {
                    ghost_text = {
                        hl_group = "Comment",
                    },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp", priority = 50 },
                    { name = "path",     priority = 40 },
                    { name = "luasnip",  priority = 30 },
                }, {
                    { name = "buffer", priority = 50, keyword_length = 3 },
                }),
                mapping = cmp.mapping.preset.insert({
                    -- <CR> accepts currently selected item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ["<CR>"] = cmp.mapping.confirm({
                        select = true,
                        -- behavior = cmp.ConfirmBehavior.Replace,
                    }),
                    ["<S-CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<C-space>"] = cmp.mapping.complete(),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-c>"] = function(fallback)
                        cmp.close()
                        fallback()
                    end,
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.jumpable(1) then
                            luasnip.jump(1)
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
            }
        end,
    },

    --conform.nvim format
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>fq",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                desc = "Format buffer",
            },
        },
        -- Everything in opts will be passed to setup()
        opts = {
            -- Set up format-on-save
            format_on_save = { timeout_ms = 500, lsp_fallback = true },
        },
        init = function()
            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_fallback = true, range = range })
            end, { range = true })
        end
    }
}

