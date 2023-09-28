local M = {}

function M.config()
	local dap = require("dap")
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = 8123,
		executable = {
			command = "js-debug-adapter",
		},
	}
	dap.adapters["bun"] = {
		type = "server",
		host = "localhost",
		port = 6499,
		executable = {
			command = "bun",
		},
	}
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
      {
        type= "bun",
        request= "attach",
        name= "Attach to Bun",
        url= "ws://localhost:6499/93x8wg3gvvu",
      }
    }
  end
end

return M
