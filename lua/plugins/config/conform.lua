local M = {}

---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
	local conform = require("conform")
	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end
	return select(1, ...)
end

local js_like_formatters = function(bufnr)
	if require("conform").get_formatter_info("biome", bufnr).available then
		return { "biome", "biome-check" }
	else
		return { "prettierd" }
	end
end
M.opts = {

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
		css = js_like_formatters,
		html = { "prettierd" },
		mdx = { "prettierd" },
		nix = { "nixfmt" },

		cpp = { "clang_format" },
		sh = { "shfmt" },
		proto = { "buf" },
		toml = { "taplo" },
		nginx = { "nginxfmt" },
		http = { "kulala" },
		go = { "gofmt" },
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
			condition = function(_, filedata)
				if vim.bo.filetype == "mdx" then
					return true
				end
				local plenary = require("plenary")
				local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.json")
				local biome_path2 = plenary.path:new(vim.loop.cwd() .. "/biome.jsonc")
				return not biome_path:exists() and not biome_path2:exists()
			end,
		},
		injected = {
			options = {
				-- Set to true to ignore errors
				ignore_errors = true,
				-- Map of treesitter language to filetype
				lang_to_ft = {
					bash = "sh",
				},
				-- Map of treesitter language to file extension
				-- A temporary file name with this extension will be generated during formatting
				-- because some formatters care about the filename.
				lang_to_ext = {
					bash = "sh",
					c_sharp = "cs",
					elixir = "exs",
					javascript = "js",
					julia = "jl",
					latex = "tex",
					markdown = "md",
					python = "py",
					ruby = "rb",
					rust = "rs",
					teal = "tl",
					typescript = "ts",
				},
			},
		},
	},
}

return M
