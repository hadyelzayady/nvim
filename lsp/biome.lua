local util = require("utils.lsp.lspconfig")
local function has_biome_config()
	local eslint_files = {
		"biome.json",
	}
	for _, file in ipairs(eslint_files) do
		if vim.fn.glob(file) ~= "" then
			return true
		end
	end
	return false
end
local root_file = {
	"tsconfig.json",
	"jsconfig.json",
	"package.json",
	".git",
	"biome.json",
}
---@type vim.lsp.Config
return {
	cmd = { "bunx", "biome", "lsp-proxy" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	filetypes = {
		"astro",
		"css",
		"graphql",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"svelte",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"vue",
	},

	root_dir = function(cb)
		if not has_biome_config() then
			-- vim.notify('No ESLint config found, disabling ESLint LSP', vim.log.levels.WARN,{silent=true})
			return nil
		end
		local bufnr = vim.api.nvim_get_current_buf()
		if not vim.api.nvim_buf_is_valid(bufnr) then
			return
		end
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if #bufname ~= 0 and not util.bufname_valid(bufname) then
			return
		end
		local fname = vim.fs.normalize(bufname)
		root_file = util.insert_package_json(root_file, "eslintConfig", fname)
		cb(util.root_pattern(".git", "biome.json")(fname))
	end,
}
