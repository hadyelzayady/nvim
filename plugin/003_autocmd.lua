local au = vim.api.nvim_create_augroup("GlobalSettings", { clear = true })

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd({ "TextYankPost" }, {
	group = au,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

-- Check for external file changes
autocmd({ "FileChangedShellPost" }, {
	group = au,
	callback = function()
		vim.notify("File changed outside of Neovim", vim.log.levels.WARN)
	end,
})

-- Restore cursor position on file open
autocmd({ "BufReadPost" }, {
	group = au,
	callback = function()
		local exclude = { "gitcommit" }
		local filetype = vim.bo.filetype
		if not vim.tbl_contains(exclude, filetype) then
			local mark = vim.api.nvim_buf_get_mark(0, '"')
			local lcount = vim.api.nvim_buf_line_count(0)
			if mark[1] > 0 and mark[1] <= lcount then
				pcall(vim.api.nvim_win_set_cursor, 0, mark)
			end
		end
	end,
})

-- disable highlights from lsp
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function()
		-- Forces Neovim to redraw all statuslines immediately
		vim.cmd.redrawstatus()
	end,
})

autocmd("FileType", {
	pattern = { "*" },
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if not lang then
			return
		end

		if vim.treesitter.query.get(lang, "highlights") then
			vim.treesitter.start(args.buf)
		end

		-- if vim.treesitter.query.get(lang, "indents") then
		-- 	vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
		-- end

		if vim.treesitter.query.get(lang, "folds") then
			vim.opt_local.foldmethod = "expr"
			vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end
	end,
})

autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})
