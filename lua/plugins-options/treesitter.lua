local M = {}
function M.config()
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
	vim.treesitter.language.register("markdown", "mdx")
end
return M
