return {
    "saghen/blink.cmp",
    build = "cargo build --release",
    version = "*",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
        keymap = {
            preset = "default",
            ["<Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.snippet_forward()
                    else
                        return cmp.select_next()
                    end
                end,
                "fallback",
            },
            ["<S-Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.snippet_backward()
                    else
                        return cmp.select_prev()
                    end
                end,
                "fallback",
            },
        },

        snippets = {
            preset = "luasnip",
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },

        signature = { enabled = true },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },

            per_filetype = {
                org = { "lsp", "orgmode", "path", "snippets", "buffer" },
            },
            providers = {
                orgmode = {
                    name = "Orgmode",
                    module = "orgmode.org.autocompletion.blink",
                    fallbacks = { "buffer" },
                },
            },
        },
    },
    config = function(_, opts)
        require("blink.cmp").setup(opts)

        -- Load VSCode-style snippets
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}

--[[ return {
    "saghen/blink.cmp",
    build = "cargo build --release", -- builds the Rust native extension
    version = "*",                   -- you can pin to "1.*" for stability if you want
    opts = {
        keymap = {
            preset = "default",
            ["<Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.snippet_forward()
                    else
                        return cmp.select_next()
                    end
                end,
                "fallback",
            },
            ["<S-Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.snippet_backward()
                    else
                        return cmp.select_prev()
                    end
                end,
                "fallback",
            },
        },

        snippets = {
            preset = "luasnip",
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },
        signature = { enabled = true }
    },
    -- Optionally, dependencies if you use cmp:
    dependencies = {
        "hrsh7th/nvim-cmp",
        'rafamadriz/friendly-snippets',
    },
} ]]
