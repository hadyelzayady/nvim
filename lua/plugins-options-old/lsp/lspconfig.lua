local M = {}
function M.config(_, opts)
	require("plugins-options.lsp.hoverdoc").setup()
	require("plugins-options.lsp.diagnostics").setup()

	vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
	-- -- Setup language servers.
	require("config.keymaps").lsp_global_setup()
	require("config.keymaps").on_attach_setup()
	require("plugins-options.lsp.servers-configs").setup()

	-- vim.api.nvim_create_autocmd("LspAttach", {
	-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	-- 	callback = function(ev)
	-- 		local clientId = ev.data.client_id
	-- 		local client = vim.lsp.get_client_by_id(clientId)
	--      print(vim.inspect(client))
	-- 		if client.server_capabilities.inlayHintProvider then
	-- 			vim.lsp.inlay_hint.enable(0, true)
	-- 		end
	-- 	end,
	-- })
end
return M
