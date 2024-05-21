local M = {}

function M.config()
	require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended

	-- If the lsp setup is taken over by other plugin, it is the same to call the counterpart setup function
	require("lspconfig").vtsls.setup({ --[[ your custom server config here ]]
		on_attach = function(client)
			client.server_capabilities.semanticTokensProvider = false
      client.server_capabilities.documentHighlightProvider=false
			-- vim.lsp.inlay_hint.enable(0, true)
		end,
		settings = {
			typescript = {
				inlayHints = {
					parameterNames = { enabled = "literals" },
					parameterTypes = { enabled = true },
					variableTypes = { enabled = false },
					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enabled = true },
					enumMemberValues = { enabled = true },
				},
			},
		},
	})
end

return M
