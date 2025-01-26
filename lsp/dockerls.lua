local util = require("utils.lsp.lspconfig")
return {
	cmd = { "docker-langserver", "--stdio" },
	root_dir = function(cb)
		local bufnr = vim.api.nvim_get_current_buf()
		if not vim.api.nvim_buf_is_valid(bufnr) then
			return
		end
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if #bufname ~= 0 and not util.bufname_valid(bufname) then
			return
		end
		local fname = vim.fs.normalize(bufname)
		cb(util.root_pattern("Dockerfile")(fname))
	end,
	filetypes = { "dockerfile" },
	single_file_support = true,
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true,
				},
			},
		},
	},
}
