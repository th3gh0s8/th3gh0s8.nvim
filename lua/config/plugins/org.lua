return {
    "nvim-orgmode/orgmode",
    dependencies = {
        "nvim-orgmode/telescope-orgmode.nvim",
        "nvim-orgmode/org-bullets.nvim",
        "danilshvalov/org-modern.nvim",
    },
    event = "VeryLazy",
    ft = { "org" },
    config = function()
        --Load the org-modern Menu
        local Menu = require("org-modern.menu")
        -- Setup orgmode
        require("orgmode").setup({
            org_agenda_files = "~/orgfiles/**/*",
            org_default_notes_file = "~/orgfiles/refile.org",
            -- The UI Menu integration
            ui = {
                menu = {
                    handler = function(data)
                        Menu:new():open(data)
                    end,
                },
            },
        })

        require("telescope").load_extension("orgmode")

        local ext = require("telescope").extensions.orgmode
        vim.keymap.set("n", "<leader>oh", ext.search_headings, { desc = "Org headlines" })
        vim.keymap.set("n", "<leader>ot", ext.search_tags, { desc = "Org tags" })
        vim.keymap.set("n", "<leader>or", ext.refile_heading, { desc = "Org refile" })
        vim.keymap.set("n", "<leader>ol", ext.insert_link, { desc = "Org insert link" })

        require("org-bullets").setup()
        -- Experimental LSP support
        vim.lsp.enable("org")
    end,
}
