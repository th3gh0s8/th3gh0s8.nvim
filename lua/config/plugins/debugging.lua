return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dapui").setup()
        require("dap-go").setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
        vim.keymap.set("n", "<leader>dx", dap.run_to_cursor, { desc = "Debug: Run to cursor" })

        -- Eval var under cursor
        vim.keymap.set("n", "<leader>d?", function()
            require("dapui").eval(nil, { enter = true })
        end, { desc = "Debug: Eval var under cursor" })

        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue/Start" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step into" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step over" })
        vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Debug: Step out" })
        vim.keymap.set("n", "<leader>db", dap.step_back, { desc = "Debug: Step back" })
        vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: Restart" })
    end,
}
