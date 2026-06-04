require("set")
require("remap")
require("config.lazy")

vim.o.guifont = "BigBlueTerm437 Nerd Font:h12"
vim.opt.clipboard = "unnamedplus"

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_trail_size = 1.0
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_smooth_blink = false

local augroup = vim.api.nvim_create_augroup
local myGroup = augroup("th3gh0s8", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- Reloads a Lua module so subsequent `require()` calls load its updated code.
-- @param name The module name as passed to `require` (e.g. "my.plugin.module").
function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = myGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
    group = myGroup,
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, vim.tbl_extend("force", opts, { desc = "LSP: Go to Definition" }))

        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, vim.tbl_extend("force", opts, { desc = "LSP: Hover Documentation" }))

        vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
        end, vim.tbl_extend("force", opts, { desc = "LSP: Workspace Symbols" }))

        vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
        end, vim.tbl_extend("force", opts, { desc = "Diagnostics: Show Float" }))

        vim.keymap.set("n", "<leader>vca", function()
            vim.lsp.buf.code_action()
        end, vim.tbl_extend("force", opts, { desc = "LSP: Code Actions" }))

        vim.keymap.set("n", "<leader>vrr", function()
            vim.lsp.buf.references()
        end, vim.tbl_extend("force", opts, { desc = "LSP: Find References" }))

        vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
        end, vim.tbl_extend("force", opts, { desc = "LSP: Rename Symbol" }))

        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, vim.tbl_extend("force", opts, { desc = "LSP: Signature Help" }))

        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = 1 })
        end, vim.tbl_extend("force", opts, { desc = "Diagnostics: Next" }))

        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = -1 })
        end, vim.tbl_extend("force", opts, { desc = "Diagnostics: Previous" }))
    end,
})

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 0

vim.opt.compatible = false    -- Equivalent to 'set nocompatible'
vim.cmd("filetype plugin on") -- Enable filetype plugins
vim.cmd("syntax on")          -- Enable syntax highlighting

-- vim.opt.clipboard = "unnamedplus"
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd("TextYankPost", {
--     desc = "Highlight when yanking (copying) text",
--     group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
--     callback = function()
--         vim.highlight.on_yank()
--     end,
-- })
