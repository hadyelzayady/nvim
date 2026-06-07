local au = vim.api.nvim_create_augroup("GlobalSettings", { clear = true })

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd('TextYankPost', {
  callback = function()
    vim.hl.hl_op()
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

-- Lazy load octo on first :Octo command
autocmd("CmdUndefined", {
	group = au,
	pattern = "Octo",
	once = true,
	callback = function()
		Config.lazy_require("octo", {
			picker = "fzf-lua",
			use_local_fs = true,
		})
	end,
})

-- Lazy load codediff on first :CodeDiff command
autocmd("CmdUndefined", {
	group = au,
	pattern = "CodeDiff",
	once = true,
	callback = function()
		Config.lazy_require("codediff", { diff = { compute_moves = true } })
	end,
})

-- Lazy load copilot on first InsertEnter
autocmd("InsertEnter", {
	group = au,
	once = true,
	callback = function()
		Config.lazy_require("copilot", {
			filetypes = { sql = true },
			should_attach = function()
				return true
			end,
			nes = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
					next = "<C-j>",
					prev = "<C-k>",
					dismiss = "<C-x>",
				},
			},
		})
	end,
})

-- Lazy load dadbod-grip on first :GripConnect command
autocmd("CmdUndefined", {
	group = au,
	pattern = "GripConnect",
	once = true,
	callback = function()
		Config.lazy_require("dadbod-grip")
	end,
})

-- FylerToggle: lazy loads fyler on first use
vim.api.nvim_create_user_command("FylerToggle", function()
	local fyler = Config.lazy_require("fyler", {
		views = {
			finder = {
				close_on_select = false,
				default_explorer = true,
				delete_to_trash = true,
				columns_order = { "link", "git", "diagnostic" },
				win = {
					kind = "split_left_most",
					kinds = {
						split_left_most = { width = "13%" },
					},
					win_opts = { cursorline = true },
				},
			},
		},
	})
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "fyler" then
			vim.api.nvim_win_close(win, false)
			return
		end
	end
	fyler.open()
end, {})
