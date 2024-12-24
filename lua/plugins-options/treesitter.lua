local M = {}
function M.config()
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
			disable = function(lang, buf)
				if lang == "yaml" then
					return false
				end
				local max_filesize = 180 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
	})
	vim.treesitter.language.register("markdown", "mdx")
end
return M
