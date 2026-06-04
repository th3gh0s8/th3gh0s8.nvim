-- lua/custom/plugins/mini.lua
return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.icons").setup()
    end,
}
