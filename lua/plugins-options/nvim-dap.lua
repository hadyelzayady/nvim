local M = {}
function M.config()
	local dap = require("dap")

	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Debug (Attach) - Remote",
			hostName = "127.0.0.1",
			port = 5005,
		},
	}
	dapUI()
	dap.adapters.lldb = {
		type = "executable",
		command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
		name = "lldb",
	}
	c_like_dap_config("cpp")
	c_like_dap_config("rust")
	dap.configurations.rust[1].initCommands = function()
		-- Find out where to look for the pretty printer Python module
		local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

		local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
		local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

		local commands = {}
		local file = io.open(commands_file, "r")
		if file then
			for line in file:lines() do
				table.insert(commands, line)
			end
			file:close()
		end
		table.insert(commands, 1, script_import)

		return commands
	end
	dap.adapters.node2 = {
		type = "executable",
		command = "node",
		args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
	}
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "4711",
		executable = {
			command = "node",
			-- 💀 Make sure to update this path to point to your installation
			args = { vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/out/src/vsDebugServer.js", "4711" },
		},
	}
	dap.adapters.node2 = {
		type = "executable",
		command = "node",
		args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
	}
	for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
		require("dap").configurations[language] = {
			-- type = "node2",
			-- request = "launch",
			program = "${workspaceFolder}/node_modules/.bin/jest",
			args = { "--runInBand" },
			-- cwd = vim.fn.getcwd(),
			-- sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			-- program = "${file}",
			cwd = "${workspaceFolder}",
		}
	end
end

function c_like_dap_config(type)
	local dap = require("dap")
	dap.configurations[type] = {
		{
			name = "Launch",
			type = "lldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},

			-- 💀
			-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
			--
			--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			--
			-- Otherwise you might get the following error:
			--
			--    Error on launch: Failed to attach to the target process
			--
			-- But you should be aware of the implications:
			-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
			-- runInTerminal = false,
		},
		{
			-- If you get an "Operation not permitted" error using this, try disabling YAMA:
			--  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			name = "Attach to process",
			type = "lldb", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
			request = "attach",
			pid = require("dap.utils").pick_process,
			args = {},
		},
	}
end

function dapUI()
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
end
return M
