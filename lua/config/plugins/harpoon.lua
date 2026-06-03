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

        -- Toggle quick menu
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon: Toggle quick menu" })

        -- Navigation keybindings (F1-F6 for Windows compatibility)
        for i = 1, 6 do
            vim.keymap.set("n", string.format("<F%d>", i), function()
                harpoon:list():select(i)
            end, { desc = "Harpoon: Nav file " .. i })
        end
    end,
}
