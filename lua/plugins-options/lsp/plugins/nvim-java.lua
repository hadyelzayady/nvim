local M = {}

function M.config()
	require("java").setup()
	require("lspconfig").jdtls.setup({
		on_attach = require("plugins-options.lsp.lspconfig").on_attach,
		on_init = function(client)
			if client.config.settings then
				client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
			end
		end,
	})

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
end

return M
