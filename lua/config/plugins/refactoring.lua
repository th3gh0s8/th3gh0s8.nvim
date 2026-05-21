return {
    "ThePrimeagen/refactoring.nvim",
    config = function()
        require("refactoring").setup({})
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "lewis6991/async.nvim",
    },
    lazy = false,
    opts = {},
}
