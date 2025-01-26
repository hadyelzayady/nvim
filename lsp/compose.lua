local util = require("utils.lsp.lspconfig")
return {
	cmd = { "docker-compose-langserver", "--stdio" },
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
		cb(util.root_pattern("docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml")(fname))
	end,
	filetypes = { "yaml.docker-compose" },
	-- handlers = {
	-- 	["textDocument/definition"] = function()
	-- 		require("utils.lsp.handlers.yaml").yaml_goto_definition()
	-- 	end,
	-- },
	single_file_support = true,
}
