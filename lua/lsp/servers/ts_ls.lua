local M = {}
function M.setup()
	vim.lsp.config("ts_ls", {
		on_init = function(client)
			client.config.capabilities.textDocument.codeLens = { dynamicRegistration = true }
		end,
		settings = {
			typescript = {
				preferences = {
					importModuleSpecifier = "relative", -- "non-relative" if you like aliases
					quoteStyle = "single", -- or "double"
					includeCompletionsForModuleExports = true,
					includeCompletionsWithInsertText = true,
				},
				suggest = {
					completeFunctionCalls = true, -- auto-insert parentheses
				},
				inlayHints = {
					includeInlayParameterNameHints = "all", -- "none" | "literals" | "all"
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = false,
					includeInlayPropertyDeclarationTypeHints = false,
					includeInlayFunctionLikeReturnTypeHints = false,
					includeInlayEnumMemberValueHints = true,
				},
				implementationsCodeLens = { enabled = true },
				referencesCodeLens = { enabled = true, showOnAllFunctions = true },
			},
			javascript = {
				-- Mirror TypeScript settings for JS
				preferences = {
					importModuleSpecifier = "relative",
					quoteStyle = "single",
				},
				suggest = {
					completeFunctionCalls = true,
				},
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayFunctionParameterTypeHints = true,
				},
			},
		},
	})
end
return M
