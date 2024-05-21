local M = {}

function M.config()
	local actions = require("fzf-lua.actions")
	local fzf = require("fzf-lua")
	local icons = require("utils.ui-components").icons
	require("fzf-lua").setup({
		"max-perf",
		files = {
			prompt = "Files❯ ",
			multiprocess = true, -- run command in a separate process
			cwd_prompt = false,
			cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
			cwd_prompt_shorten_val = 1, -- shortened path parts length
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
			},
			-- formatter = "path.filename_first",
		},
		oldfiles = {
			cwd_only = true,
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
			},
		},
		grep = {
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
			},
		},
		buffers = {
			cwd_only = true,
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
			},
		},
	})

	fzf.register_ui_select()
end
return M
