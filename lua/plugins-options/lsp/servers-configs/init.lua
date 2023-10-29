local M = {}
function M.setup()
	-- require("vtsls").setup()
	require("plugins-options.lsp.servers-configs.lua").setup()
	require("plugins-options.lsp.servers-configs.docker").setup()
	require("plugins-options.lsp.servers-configs.docker-compose").setup()
	require("plugins-options.lsp.servers-configs.csslsp").setup()
	require("plugins-options.lsp.servers-configs.cssmodules").setup()
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
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
