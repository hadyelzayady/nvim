local M = {}

function M.setup()
	-- require("vtsls").setup()
	require("plugins-options.lsp.servers-configs.lua").setup()
	-- require("plugins-options.lsp.servers-configs.docker").setup()
	-- require("plugins-options.lsp.servers-configs.docker-compose").setup()
	require("plugins-options.lsp.servers-configs.csslsp").setup()
	require("plugins-options.lsp.servers-configs.cssmodules").setup()
	-- require("plugins-options.lsp.servers-configs.sh").setup()
	-- require("plugins-options.lsp.servers-configs.bufls").setup()
	-- require("plugins-options.lsp.servers-configs.json").setup()
	require("plugins-options.lsp.servers-configs.eslint").setup()
	require("plugins-options.lsp.servers-configs.biome").setup()
	require("plugins-options.lsp.servers-configs.yaml").setup()
	require("plugins-options.lsp.servers-configs.rust").setup()
end

return M
