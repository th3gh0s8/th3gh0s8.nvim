return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        require("telescope").setup({
            extensions = {
                fzf = {}
            }
        })

        require('telescope').load_extension('fzf')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope: Help tags" })
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope: Find files" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope: Git files" })
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Telescope: Grep word under cursor" })
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Telescope: Grep WORD under cursor" })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Telescope: Grep input" })
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Telescope: Help tags (v)" })
        vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Telescope: Find Todos" })

        vim.keymap.set("n", "<leader>ed", function()
            builtin.find_files({
                cwd = vim.fn.stdpath("config")
            })
        end, { desc = "Telescope: Edit config" })
    end,
}
