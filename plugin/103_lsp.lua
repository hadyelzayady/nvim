vim.pack.add({
	{ src = "https://github.com/b0o/schemastore.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

-- LSP configuration using vim.lsp.config (Neovim 0.11+)

--=============== Sign Config ===============
-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

--=============== LSP Handlers =============--
-- vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
-- 	config = config or {}
-- 	config.border = config.border or "rounded"
-- 	return vim.lsp.handlers.hover(_, result, ctx, config)
-- end

-- vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
-- 	config = config or {}
-- 	config.border = config.border or "rounded"
-- 	return vim.lsp.handlers.signature_help(_, result, ctx, config)
-- end

--=============== Inlay Hint =============--
vim.lsp.inlay_hint.enable = true

local on_attach = function(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if client.server_capabilities.linkedEditingRangeProvider then
		vim.lsp.linked_editing_range.enable(true, { client_id = ev.data.client_id })
	end
end
Config.new_autocmd("LspAttach", nil, on_attach, "linked editing range")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
capabilities.general.positionEncodings = { "utf-16" }

vim.lsp.config("*", {
	capabilities = capabilities,
})
--=============== Load LSP Servers =============--
local lsp_servers = {
	"lua_ls",
	"vtsls",
	"somesass_ls",
	"cssmodules_ls",
	"yamlls",
	"jsonls",
    "biome"
	-- "tsgo",
}

--=============== Enable LSP Servers ===============
for _, server in ipairs(lsp_servers) do
	vim.lsp.enable(server)
end
