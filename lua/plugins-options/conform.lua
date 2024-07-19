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
function M.get_buffer_active_formatter()
	local buffer_formatters = require("conform").list_formatters_for_buffer()
	local active_formatters = {}
	for _, formatter_name_or_table in pairs(buffer_formatters) do
		if type(formatter_name_or_table) == "table" then
			for _, formatter in pairs(formatter_name_or_table) do
				if require("conform").get_formatter_info(formatter).available then
					table.insert(active_formatters, formatter)
					break
				end
			end
		else
			if require("conform").get_formatter_info(formatter_name_or_table).available then
				table.insert(active_formatters, formatter_name_or_table)
			end
		end
	end
  return active_formatters
end

return M
