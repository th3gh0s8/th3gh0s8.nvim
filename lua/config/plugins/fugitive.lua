return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git: Status" })

        local gh0s8_Fugitives = vim.api.nvim_create_augroup("gh0s8_Fugitives", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = gh0s8_Fugitives,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git("push")
                end, vim.tbl_extend("force", opts, { desc = "Git: Push" }))

                vim.keymap.set("n", "<leader>gf", function()
                    vim.cmd.Git("fetch")
                end, vim.tbl_extend("force", opts, { desc = "Git: Fetch origin " }))

                vim.keymap.set("n", "<leader>gr", function()
                    vim.cmd.Git({ "pull", "--rebase" })
                end, vim.tbl_extend("force", opts, { desc = "Git: Pull --rebase" }))

                vim.keymap.set("n", "<leader>gu", function()
                    vim.cmd.Git({ "pull" })
                end, vim.tbl_extend("force", opts, { desc = "Git: Pull " }))

                -- NOTE: It allows us to set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set(
                    "n",
                    "<leader>gp",
                    ":Git push -u origin ",
                    vim.tbl_extend("force", opts, { desc = "Git: Push -u origin ..." })
                )
            end,
        })

        vim.keymap.set("n", "gj", "<cmd>diffget //2<CR>", { desc = "Git: Diffget 2" })
        vim.keymap.set("n", "gk", "<cmd>diffget //3<CR>", { desc = "Git: Diffget 3" })
    end,
}
