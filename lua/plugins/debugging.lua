return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = {
					"williamboman/mason.nvim",
				},
				config = function()
					require("mason-nvim-dap").setup({
						ensure_installed = { "codelldb", "python" },
						automatic_setup = true,
						handlers = {},
					})
				end,
			},
			{
				"mfussenegger/nvim-dap",
				config = function()
					local dap_breakpoint = {
						error = {
							text = "",
							texthl = "DiagnosticSignError",
							linehl = "",
							numhl = "",
						},
						rejected = {
							text = "",
							texthl = "DiagnosticSignHint",
							linehl = "",
							numhl = "",
						},
						stopped = {
							text = "⭐️",
							texthl = "DiagnosticSignInformation",
							linehl = "DiagnosticUnderlineInfo",
							numhl = "DiagnosticSignInformation",
						},
					}
					vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
					vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
					vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

					-- Set keymaps
					local dap = require("dap")
					vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
					vim.keymap.set("n", "<F5>", dap.continue)
					vim.keymap.set("n", "<F6>", dap.run_to_cursor)
					vim.keymap.set("n", "<F7>", dap.step_over)
					vim.keymap.set("n", "<F8>", dap.step_into)
					vim.keymap.set("n", "<F9>", dap.step_out)
					vim.keymap.set("n", "<F10>", dap.terminate)
				end,
			},
		},
		config = function()
			require("dapui").setup()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
