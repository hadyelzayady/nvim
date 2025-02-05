local M = {}
function M.config()
	local dap = require("dap")
	-- dap.adapters.java = function(callback)
	-- 	local port = 5005 -- Change this if needed
	-- 	callback({
	-- 		type = "server",
	-- 		host = "127.0.0.1",
	-- 		port = port,
	-- 	})
	-- end

	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Attach to JVM",
			hostName = "127.0.0.1",
			port = 5005,
		},
		{
			type = "java",
			request = "attach",
			name = "Debug (Attach) - Remote",
			hostName = "127.0.0.1",
			processId = require("dap.utils").pick_process,
			mainClass = "project-manager.infrastructure.main",
			projectName = "infrastructure",
			port = 5005,
		},
	}
end
return M
