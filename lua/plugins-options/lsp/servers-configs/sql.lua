local M = {}

function M.setup()
	require("lspconfig").sqls.setup({
		on_attach = function(client, bufnr)
			require("sqls").on_attach(client, bufnr)
		end,
		settings = {
			sqls = {
				connections = {
					{
						driver = "postgresql",
						dataSourceName = "host=127.0.0.1 port=5432 user=pmp password=pmp dbname=pmp sslmode=disable",
						schemas = { "public", "coredb" },
					},
				},
			},
		},
	})
end

return M
