return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- Add current file to Harpoon
        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add file" })

        -- Toggle Harpoon quick menu
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon: Toggle quick menu" })

        -- Quick navigation to files 1-6 (using F-keys for Windows compatibility)
        vim.keymap.set("n", "<F1>", function()
            ui.nav_file(1)
        end, { desc = "Harpoon: Go to file 1" })
        vim.keymap.set("n", "<F2>", function()
            ui.nav_file(2)
        end, { desc = "Harpoon: Go to file 2" })
        vim.keymap.set("n", "<F3>", function()
            ui.nav_file(3)
        end, { desc = "Harpoon: Go to file 3" })
        vim.keymap.set("n", "<F4>", function()
            ui.nav_file(4)
        end, { desc = "Harpoon: Go to file 4" })
        vim.keymap.set("n", "<F5>", function()
            ui.nav_file(5)
        end, { desc = "Harpoon: Go to file 5" })
        vim.keymap.set("n", "<F6>", function()
            ui.nav_file(6)
        end, { desc = "Harpoon: Go to file 6" })

        -- Alternative navigation with leader key for consistency
        vim.keymap.set("n", "<C-1>", function()
            ui.nav_file(1)
        end, { desc = "Harpoon: Go to file 1" })
        vim.keymap.set("n", "<C-2>", function()
            ui.nav_file(2)
        end, { desc = "Harpoon: Go to file 2" })
        vim.keymap.set("n", "<C-3>", function()
            ui.nav_file(3)
        end, { desc = "Harpoon: Go to file 3" })
        vim.keymap.set("n", "<C-4>", function()
            ui.nav_file(4)
        end, { desc = "Harpoon: Go to file 4" })
        vim.keymap.set("n", "<C-5>", function()
            ui.nav_file(5)
        end, { desc = "Harpoon: Go to file 5" })
        vim.keymap.set("n", "<C-6>", function()
            ui.nav_file(6)
        end, { desc = "Harpoon: Go to file 6" })

        -- "Replace" mark at slot 1-6 by removing it and adding the current file.
        -- Note: This will append the current file to the end of the list, not keep it at the same slot.
        vim.keymap.set("n", "<A-1>", function()
            mark.rm_file(1)
            mark.add_file()
        end, { desc = "Harpoon: Replace file 1 with current" })

        vim.keymap.set("n", "<A-2>", function()
            mark.rm_file(2)
            mark.add_file()
        end, { desc = "Harpoon: Replace file 2 with current" })

        vim.keymap.set("n", "<A-3>", function()
            mark.rm_file(3)
            mark.add_file()
        end, { desc = "Harpoon: Replace file 3 with current" })

        vim.keymap.set("n", "<A-4>", function()
            mark.rm_file(4)
            mark.add_file()
        end, { desc = "Harpoon: Replace file 4 with current" })

        vim.keymap.set("n", "<A-5>", function()
            mark.rm_file(5)
            mark.add_file()
        end, { desc = "Harpoon: Replace file 5 with current" })

        vim.keymap.set("n", "<A-6>", function()
            mark.rm_file(6)
            mark.add_file()
        end, { desc = "Harpoon: Replace file 6 with current" })
    end,
}
