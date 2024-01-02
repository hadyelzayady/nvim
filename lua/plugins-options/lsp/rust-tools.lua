local M = {}

function M.config(_)
	require("rust-tools").setup({
		tools = {
			inlay_hints = {
				auto = true,
				show_parameter_hints = false,
				parameter_hints_prefix = "",
				other_hints_prefix = "",
			},
		},
		server = {
			-- on_attach = require("") on_attach,
			capabilities = require("plugins-options.lsp.servers-configs").capabilities,
			settings = {
				-- to enable rust-analyzer settings visit:
				-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
				["rust-analyzer"] = {
					checkOnSave = true,
					--      {
					-- 	command = "clippy",
					-- },
				},
			},
		},
	})
end

return M
