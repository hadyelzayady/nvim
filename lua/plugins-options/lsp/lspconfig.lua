local M = {}
function M.config(_, opts)
	require("plugins-options.lsp.hoverdoc").setup()
	require("plugins-options.lsp.diagnostics").setup()

	vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
	-- -- Setup language servers.
	require("config.keymaps").lsp_global_setup()
	require("config.keymaps").on_attach_setup()
	require("plugins-options.lsp.servers-configs").setup()
end
return M
