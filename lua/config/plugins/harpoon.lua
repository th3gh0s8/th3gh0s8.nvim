return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- Add file to harpoon
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Harpoon: Add file" })

        --[[    vim.keymap.set("n", "<leader>A", function()
            harpoon:list():prepend()
        end) ]]

        -- Toggle quick menu
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon: Toggle quick menu" })

        -- Navigation keybindings (F1-F6 for Windows compatibility)
        --[[ for i = 1, 6 do
            vim.keymap.set("n", string.format("<F%d>", i), function()
                harpoon:list():select(i)
            end, { desc = "Harpoon: Nav file " .. i })
        end ]]
        vim.keymap.set("n", "<C-h>", function()
            harpoon:list():select(1)
        end, { desc = "Harpoon: File 1" })
        vim.keymap.set("n", "<C-j>", function()
            harpoon:list():select(2)
        end, { desc = "Harpoon: File 2" })
        vim.keymap.set("n", "<C-k>", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon: File 3" })
        vim.keymap.set("n", "<C-l>", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon: File 4" })

        vim.keymap.set("n", "<C-;>", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<C-'>", function()
            harpoon:list():next()
        end)
    end,
}
