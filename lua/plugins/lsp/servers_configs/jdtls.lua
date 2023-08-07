local M = {}

function M.setup()
	require("lspconfig").jdtls.setup({
		cmd = { "jdtls" },
		capabilities = require("plugins.lsp.servers_configs").capabilities,
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
		end,
	})
end

return M
