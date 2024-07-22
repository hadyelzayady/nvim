local M = {}

function M.config()
	require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended

	-- If the lsp setup is taken over by other plugin, it is the same to call the counterpart setup function
	require("lspconfig").vtsls.setup({ --[[ your custom server config here ]]
	})
	require("vtsls").config({
		refactor_auto_rename = true,
	})
end

return M
