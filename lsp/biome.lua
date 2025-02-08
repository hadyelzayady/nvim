local util = require("utils.lsp.lspconfig")
local function has_biome_config()
	local biome_files = {
		"biome.json",
		"biome.jsonc",
	}
	for _, file in ipairs(biome_files) do
		if vim.fn.glob(file) ~= "" then
			return true
		end
	end
	return false
end

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
		if not has_biome_config() or require("utils.lsp.setup").global_ignored() then
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
		cb(util.root_pattern(".git", "biome.json", "biome.jsonc")(fname))
	end,
}
