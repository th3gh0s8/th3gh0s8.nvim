vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View (Ex)" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line below" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "LSP: Restart" })

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end, { desc = "VimWithMe: Start" })
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end, { desc = "VimWithMe: Stop" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank whole line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to black hole register" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit Insert mode (Esc alternative)" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode (Q)" })

vim.keymap.set(
    "n",
    "<C-f>",
    "<cmd>silent !tmux neww tmux-sessionizer<CR>",
    { desc = "Tmux: Open sessionizer" }
)

vim.keymap.set(
    "n",
    "<M-h>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>",
    { desc = "Tmux: Open session 0" }
)
vim.keymap.set(
    "n",
    "<M-t>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>",
    { desc = "Tmux: Open session 1" }
)
vim.keymap.set(
    "n",
    "<M-n>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>",
    { desc = "Tmux: Open session 2" }
)
vim.keymap.set(
    "n",
    "<M-s>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>",
    { desc = "Tmux: Open session 3" }
)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "LSP: Format buffer" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quickfix: Next" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Quickfix: Previous" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Location List: Next" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Location List: Previous" })

vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word under cursor (global)" }
)

-- Manual completion trigger for blink.cmp using a Windows-friendly key combination
vim.keymap.set("i", "<C-j>", function()
    local ok, blink_cmp = pcall(require, "blink.cmp")
    if ok then
        blink_cmp.show()
    end
end, { desc = "Blink: Trigger completion" })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
    { desc = "Go: Insert error check" }
)

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set(
    "n",
    "<leader>vc",
    "<cmd>Ex " .. vim.fn.stdpath("config") .. "<CR>",
    { desc = "Config: Open directory" }
)

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Fun: Make it rain" })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source current file" })

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split: Vertical" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split: Horizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split: Equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Split: Close" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Tab: Open new" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Tab: Close" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Tab: Next" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Tab: Previous" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Tab: Move buffer to new" })

vim.keymap.set("n", "<leader>ts", "<cmd>PlenaryBustedFile %<CR>", { desc = "Plenary: Run test" })
