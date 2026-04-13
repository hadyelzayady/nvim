vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

-- LSP configuration using vim.lsp.config (Neovim 0.11+)

--=============== Diagnostic Config ===============
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
	},
})

--=============== Sign Config ===============
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

--=============== LSP Handlers =============--
-- vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
-- 	config = config or {}
-- 	config.border = config.border or "rounded"
-- 	return vim.lsp.handlers.hover(_, result, ctx, config)
-- end

vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
	config = config or {}
	config.border = config.border or "rounded"
	return vim.lsp.handlers.signature_help(_, result, ctx, config)
end

--=============== Inlay Hint =============--
vim.lsp.inlay_hint.enable = true

--=============== Load LSP Servers =============--
-- Load each LSP config from lua/lsp/*.lua (except init.lua)

local lsp_servers = {
	"lua_ls",
	"vtsls",
}

--=============== Enable LSP Servers ===============
for _, server in ipairs(lsp_servers) do
	vim.lsp.enable(server)
end

--=============== LspInfo Command ===============
vim.api.nvim_create_user_command("LspClients", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr })
	if #clients == 0 then
		print("No active LSP clients")
	else
		for _, client in ipairs(clients) do
			print(client.name .. " - " .. client.id)
		end
	end
end, {})
