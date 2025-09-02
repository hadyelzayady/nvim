local M = {}

function M.config()
	require("java").setup({
		jdtls = {
			version = "v1.43.0",
		},

		lombok = {
			version = "nightly",
		},

		-- load java test plugins
		java_test = {
			enable = true,
			version = "0.40.1",
		},

		-- load java debugger plugins
		java_debug_adapter = {
			enable = true,
			version = "0.58.1",
		},

		spring_boot_tools = {
			enable = true,
			version = "1.55.1",
		},

		jdk = {
			-- install jdk using mason.nvim
			auto_install = false,
			version = "17.0.2",
		},
	})
	require("lspconfig").jdtls.setup({
		on_init = function(client)
			client.config.capabilities.textDocument.codeLens = { dynamicRegistration = true }
		end,
		settings = {
			java = {
				contentProvider = { preferred = "fernflower" },
				inlayHints = {
					parameterNames = { enabled = "all" },
				},
				signatureHelp = { enabled = true },
				implementationsCodeLens = { enabled = true },
				referencesCodeLens = { enabled = true, showOnAllFunctions = true },
			},
		},
	})
	vim.lsp.enable("jdtls")
end

return M
