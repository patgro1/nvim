return {
    {
        "rcarriga/nvim-dap-ui",
        version = "4.*",
        event = "BufReadPre",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup({})
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
        end,
    },
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>db",
                function()
                    require("dap").list_breakpoints()
                end,
                desc = "DAP Breakpoints",
            },
            { "<F4>", "<CMD>DapTerminate<CR>", desc = "DAP Terminate" },
            { "<F5>", "<CMD>DapContinue<CR>", desc = "DAP Continue" },
            {
                "<F6>",
                function()
                    require("dap").run_to_cursor()
                end,
                desc = "DAP Continue to Cursor",
            },
            { "<F9>", "<CMD>DapToggleBreakpoint<CR>", desc = "DAP Toggle Breakpoint" },
            { "<F10>", "<CMD>DapStepOver<CR>", desc = "DAP Step Over" },
            { "<F11>", "<CMD>DapStepInto<CR>", desc = "DAP Step Into" },
            { "<F12>", "<CMD>DapStepOut<CR>", desc = "DAP Step Out" },
        },
    },
}
