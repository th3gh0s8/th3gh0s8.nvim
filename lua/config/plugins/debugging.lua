return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            require("dapui").setup()
            require("dap-go").setup()
            require("mason").setup()

            require("mason-nvim-dap").setup({
                ensure_installed = { "stylua", "jq" },
                handlers = {
                    function(config)
                        -- all sources with no handler get passed here

                        -- Keep original functionality
                        require("mason-nvim-dap").default_setup(config)
                    end,
                    --[[ python = function(config)
                        config.adapters = {
                            type = "executable",
                            command = "/usr/bin/python3",
                            args = {
                                "-m",
                                "debugpy.adapter",
                            },
                        }
                        require("mason-nvim-dap").default_setup(config) -- don't forget this!
                    end, ]]
                },
            })

            require("nvim-dap-virtual-text").setup({
                -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
                display_callback = function(variable)
                    local name = string.lower(variable.name)
                    local value = string.lower(variable.value)
                    if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
                        return "*****"
                    end

                    if #variable.value > 15 then
                        return " " .. string.sub(variable.value, 1, 15) .. "... "
                    end

                    return " " .. variable.value
                end,
            })

            -- Handled by nvim-dap-go
            -- dap.adapters.go = {
            --   type = "server",
            --   port = "${port}",
            --   executable = {
            --     command = "dlv",
            --     args = { "dap", "-l", "127.0.0.1:${port}" },
            --   },
            -- }

            local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
            if elixir_ls_debugger ~= "" then
                dap.adapters.mix_task = {
                    type = "executable",
                    command = elixir_ls_debugger,
                }

                dap.configurations.elixir = {
                    {
                        type = "mix_task",
                        name = "phoenix server",
                        task = "phx.server",
                        request = "launch",
                        projectDir = "${workspaceFolder}",
                        exitAfterTaskReturns = false,
                        debugAutoInterpretAllModules = false,
                    },
                }
            end

            vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
            vim.keymap.set("n", "<leader>dx", dap.run_to_cursor, { desc = "Debug: Run to cursor" })

            -- Eval var under cursor
            vim.keymap.set("n", "<leader>d?", function()
                require("dapui").eval(nil, { enter = true })
            end, { desc = "Debug: Evaluate expression" })

            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue/Start" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step into" })
            vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step over" })
            vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Debug: Step out" })
            vim.keymap.set("n", "<leader>db", dap.step_back, { desc = "Debug: Step back" })
            vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: Restart" })

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}
