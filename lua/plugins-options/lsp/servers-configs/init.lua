local M = {}

local function on_attach(client, bufnr)
	local methods = vim.lsp.protocol.Methods
	if client.supports_method(methods.textDocument_inlayHint) then
		local inlay_hints_group = vim.api.nvim_create_augroup("hady/toggle_inlay_hints", { clear = false })

		-- Initial inlay hint display.
		-- Idk why but without the delay inlay hints aren't displayed at the very start.
		-- vim.defer_fn(function()
		-- 	local mode = vim.api.nvim_get_mode().mode
		-- 	vim.lsp.inlay_hint.enable(bufnr, mode == "n" or mode == "v")
		-- end, 500)

		vim.api.nvim_create_autocmd("InsertEnter", {
			group = inlay_hints_group,
			desc = "Enable inlay hints",
			buffer = bufnr,
			callback = function()
				vim.lsp.inlay_hint.enable(false)
			end,
		})
		-- vim.api.nvim_create_autocmd("InsertLeave", {
		-- 	group = inlay_hints_group,
		-- 	desc = "Disable inlay hints",
		-- 	buffer = bufnr,
		-- 	callback = function()
		-- 		vim.lsp.inlay_hint.enable(bufnr, true)
		-- 	end,
		-- })
	end
end

function M.setup()
	-- require("vtsls").setup()
	-- require("plugins-options.lsp.servers-configs.lua").setup()
	-- require("plugins-options.lsp.servers-configs.docker").setup()
	-- require("plugins-options.lsp.servers-configs.docker-compose").setup()
	require("plugins-options.lsp.servers-configs.csslsp").setup()
	require("plugins-options.lsp.servers-configs.cssmodules").setup()
	-- require("plugins-options.lsp.servers-configs.tailwindcss").setup()
	-- require("plugins-options.lsp.servers-configs.sh").setup()
	-- require("plugins-options.lsp.servers-configs.bufls").setup()
	require("plugins-options.lsp.servers-configs.json").setup()
	require("plugins-options.lsp.servers-configs.eslint").setup()
	require("plugins-options.lsp.servers-configs.biome").setup()
	-- require("plugins-options.lsp.servers-configs.yaml").setup()
	-- vim.api.nvim_create_autocmd("LspAttach", {
	-- 	desc = "Configure LSP keymaps",
	-- 	callback = function(args)
	-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
	--
	-- 		-- I don't think this can happen but it's a wild world out there.
	-- 		if not client then
	-- 			return
	-- 		end
	--
	-- 		on_attach(client, args.buf)
	-- 	end,
	-- })
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
