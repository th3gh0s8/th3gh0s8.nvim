return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "saghen/blink.cmp",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "j-hui/fidget.nvim",
        "onsails/lspkind.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        local lspkind = require("lspkind")

        -- Safe blink.cmp initialization
        local capabilities
        local ok, blink_cmp = pcall(require, "blink.cmp")
        if ok then
            capabilities = blink_cmp.get_lsp_capabilities()
        else
            vim.notify("blink.cmp failed to load, using default capabilities", vim.log.levels.WARN)
            capabilities = {}
        end

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                -- "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                -- "graphql",
                "emmet_ls",
                -- "prismals",
                "pyright",
                "zls",
                "ts_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                zls = function()
                    lspconfig.zls.setup({
                        capabilities = capabilities,
                        root_dir = lspconfig.util.root_pattern(
                            ".git",
                            "build.zig",
                            "zls.json",
                            "mvnw",
                            "gradlew",
                            "pom.xml",
                            "build.gradle"
                        ),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                },
                            },
                        },
                    })
                end,
                jdtls = function()
                    lspconfig.jdtls.setup({
                        capabilities = capabilities,
                        root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
                        settings = {
                            java = {
                                configuration = {
                                    compiler = {
                                        compileOnSave = true,
                                    },
                                },
                            },
                        },
                    })
                end,
            },
        })

        -- Format on save with condition to avoid formatting on large files or certain filetypes
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local c = vim.lsp.get_client_by_id(args.data.client_id)
                if not c then
                    return
                end

                -- Skip formatting for certain filetypes
                local skip_format_filetypes = { "markdown", "text" }
                local buf_ft = vim.api.nvim_buf_get_option(args.buf, "filetype")

                if vim.tbl_contains(skip_format_filetypes, buf_ft) then
                    return
                end

                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = args.buf,
                    callback = function()
                        -- Prevent formatting on very large files (> 100KB)
                        local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(args.buf))
                        if file_size > 100000 then
                            return
                        end

                        vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                    end,
                })
            end,
        })

        -- Blink.cmp setup (uses luasnip for snippets and friendly-snippets for snippet collection)
        if ok then
            require("blink.cmp").setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                keymap = { preset = "default" },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "mono",
                },
                signature = { enabled = true },
            })
        end

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "isort",
                "black",
            },
        })
    end,
}
