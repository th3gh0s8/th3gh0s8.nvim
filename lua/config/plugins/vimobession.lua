return {
    "tpope/vim-obsession",
    enabled = true,
    event = "VimEnter",
    init = function()
        vim.api.nvim_create_autocmd("VimLeave", {
            pattern = "*",
            group = vim.api.nvim_create_augroup("Obsession", { clear = true }),
            callback = function()
                vim.cmd("Obsession")
            end,
        })
    end,
}
