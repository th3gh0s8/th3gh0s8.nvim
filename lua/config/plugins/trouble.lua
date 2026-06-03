return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        vim.keymap.set("n", "<leader>tt", function()
            require("trouble").toggle()
        end, { desc = "Trouble: Toggle" })

        vim.keymap.set("n", "[t", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end, { desc = "Trouble: Next item" })

        vim.keymap.set("n", "]t", function()
            require("trouble").previous({ skip_groups = true, jump = true })
        end, { desc = "Trouble: Previous item" })
    end,
}
