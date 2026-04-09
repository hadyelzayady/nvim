local M = {}

function M.config()
	require("nvim-treesitter").setup({
		highlight = {
			enable = true,
			-- disable = function(lang, buf)
			--     local max_filesize = 100 * 1024 -- 100 KB
			--     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			--     if ok and stats and stats.size > max_filesize then
			--         return true
			--     end
			-- end,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "*" },
		callback = function(args)
			local lang = vim.treesitter.language.get_lang(args.match)
			if not lang then
				return
			end

			if vim.treesitter.query.get(lang, "highlights") then
				vim.treesitter.start(args.buf)
			end

			if vim.treesitter.query.get(lang, "indents") then
				vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
			end

			if vim.treesitter.query.get(lang, "folds") then
				vim.opt_local.foldmethod = "expr"
				vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end
		end,
	})
end

return M
