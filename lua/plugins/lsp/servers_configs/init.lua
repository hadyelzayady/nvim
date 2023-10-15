local M = {}

function M.setup()
	-- require("plugins.lsp.servers_configs.eslint").setup()
	require("plugins.lsp.servers_configs.vtsls").setup()
	require("plugins.lsp.servers_configs.biome").setup()
	-- require('plugins.lsp.servers_configs.rust').setup()
	-- require('plugins.lsp.servers_configs.tsserver').setup()
	require("plugins.lsp.servers_configs.json").setup()
	-- require('plugins.lsp.servers_configs.jdtls').setup()
	require("plugins.lsp.servers_configs.html").setup()
	require("plugins.lsp.servers_configs.lua").setup()
	require("plugins.lsp.servers_configs.cssmodules").setup()
	require("plugins.lsp.servers_configs.csslsp").setup()
	require("plugins.lsp.servers_configs.sh").setup()
	require("plugins.lsp.servers_configs.python").setup()
	require("plugins.lsp.servers_configs.yaml").setup()
	require("plugins.lsp.servers_configs.toml").setup()
	require("plugins.lsp.servers_configs.clangd").setup()
	require("plugins.lsp.servers_configs.go").setup()
	require("plugins.lsp.servers_configs.docker").setup()
	require("plugins.lsp.servers_configs.docker-compose").setup()
	-- require('plugins.lsp.servers_configs.markdown').setup()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
-- print(vim.inspect(capabilities))

-- nvim-cmp
M.capabilities = capabilities

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

return M
