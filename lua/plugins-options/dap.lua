local M = {}

function M.config()
	local dap = require("dap")
	local dap_icons = require("utils.ui-components").icons.debug
	vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "" })
	vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "" })
	vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "" })

	vim.fn.sign_define(
		"DapBreakpoint",
		{ text = dap_icons.breakpoint, texthl = "DapBreakpoint", linehl = "", numhl = "" }
	)
	vim.fn.sign_define("DapBreakpointCondition", {
		text = dap_icons.breakpoint_condition,
		texthl = "DapBreakpoint",
		linehl = "",
		numhl = "",
	})
	vim.fn.sign_define(
		"DapBreakpointRejected",
		{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapLogPoint",
		{ text = dap_icons.breakpoint_logpoint, texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
	)
	vim.fn.sign_define(
		"DapStopped",
		{ text = dap_icons.stopped, texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
	)
	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Debug (Attach) - Remote",
			hostName = "127.0.0.1",
			port = 5005,
		},
	}
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = 8123,
		executable = {
			command = "js-debug-adapter",
		},
	}
  require("config.keymaps").dap()
	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "node",
			},
			{
				-- If you get an "Operation not permitted" error using this, try disabling YAMA:
				--  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
				name = "Attach to process",
				type = "pwa-node", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
				request = "attach",
				pid = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
				args = {},
			},
		}
	end
end

return M
