local M = {}

function M.config()
	local lspconfig = require("lspconfig")

	local capabilities = vim.tbl_deep_extend(
		"force",
		require("config.lsp.utils").capabilities,
		require("lsp-file-operations").default_capabilities()
	)

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
	require("plugins-options.lsp.servers.json")(setup_lsp)
	require("plugins-options.lsp.servers.yaml")(setup_lsp)
	require("plugins-options.lsp.servers.prisma")(setup_lsp)
	require("plugins-options.lsp.servers.nginx")(setup_lsp)
	require("plugins-options.lsp.servers.tailwind")(setup_lsp)
	require("config.keymaps").lsp()
end

return M
