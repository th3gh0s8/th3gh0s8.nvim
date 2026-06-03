return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").toggle({
                window = {
                    width = .85 -- width will be 85% of the editor width
                }
            })
        end, { desc = "ZenMode: Toggle" })

        vim.keymap.set("n", "<leader>zZ", function()
            require("zen-mode").toggle({
                window = {
                    width = 1,
                    options = {}
                },
            })
        end, { desc = "ZenMode: Toggle (Full)" })
    end
}
