local M = {}
function M.config(_, opts)
	local js_like_formatters = { { "biome", "prettierd" } }
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = js_like_formatters,
			javascriptreact = js_like_formatters,
			typescript = js_like_formatters,
			typescriptreact = js_like_formatters,
			json = js_like_formatters,
			jsonc = js_like_formatters,
			scss = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },

			cpp = { "clang_format" },
			sh = { "shfmt" },
			proto = { "buf" },
			toml = { "taplo" },

			["*"] = { "trim_whitespace" },
		},
		formatters = {
			biome = {
				condition = function()
					local plenary = require("plenary")
					local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.json")
					return biome_path:exists()
				end,
			},
		},
	})
end
return M