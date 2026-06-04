return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-go",
        "sidlatau/neotest-dart",
        -- add any other adapters here
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-go"),
                require("neotest-dart")({
                    command = "flutter", -- or "dart"
                    use_lsp = true,
                    custom_configurations = {
                        -- any custom configurations here
                    },
                }),
            },
        })

        vim.keymap.set("n", "<leader>tc", function()
            neotest.run.run()
        end, { desc = "Neotest: Run current" })
    end,
}
