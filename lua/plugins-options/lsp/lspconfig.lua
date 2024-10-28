local M = {}

function M.config()
	local lspconfig = require("lspconfig")

	local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
	local capabilities = vim.tbl_deep_extend(
		"force",
		cmp_capabilities,
		-- returns configured operations if setup() was already called
		-- or default operations if not
		require("lsp-file-operations").default_capabilities()
	)

	capabilities.textDocument.completion.completionItem.snippetSupport = true
	-- Define a function to configure LSP servers
	local function setup_lsp(server, config)
		if config.capabilities == nil then
			config.capabilities = capabilities
		end
		lspconfig[server].setup(config)
	end

	-- Configure individual servers
	require("plugins-options.lsp.servers.vtsls")(setup_lsp)
	require("plugins-options.lsp.servers.biome")(setup_lsp)
	require("plugins-options.lsp.servers.cssmodules")(setup_lsp)
	require("plugins-options.lsp.servers.cssls")(setup_lsp)
	require("plugins-options.lsp.servers.lua")(setup_lsp)
	require("plugins-options.lsp.servers.eslint")(setup_lsp)
	require("plugins-options.lsp.servers.java")(setup_lsp)
	require("config.keymaps").lsp()
end

return M
