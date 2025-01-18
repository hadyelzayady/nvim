local M = {}
function M.config()
	local js_like_formatters = { "biome", "prettierd", stop_after_first = true }
	require("conform").setup({
		default_format_opts = {
			lsp_format = "fallback",
		},
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
			css = { "biome", "prettierd", stop_after_first = true },
			html = { "prettierd" },

			cpp = { "clang_format" },
			sh = { "shfmt" },
			proto = { "buf" },
			toml = { "taplo" },
			nginx = { "nginxfmt" },
			http = { "kulala" },
			["_"] = { "trim_whitespace" },
		},
		formatters = {
			kulala = {
				command = "kulala-fmt",
				args = { "$FILENAME" },
				stdin = false,
			},
			biome = {
				condition = function()
					local plenary = require("plenary")
					local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.json")
					local biome_path2 = plenary.path:new(vim.loop.cwd() .. "/biome.jsonc")
					return biome_path:exists() or biome_path2:exists()
				end,
			},
			prettierd = {
				condition = function()
					local plenary = require("plenary")
					local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.json")
					local biome_path2 = plenary.path:new(vim.loop.cwd() .. "/biome.jsonc")
					return not biome_path:exists() and not biome_path2:exists()
				end,
			},
		},
	})
	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return M
