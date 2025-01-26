local M = {}

function M.config()
	local fzf = require("fzf-lua")
	local actions = require("fzf-lua.actions")
	fzf.setup({
		"max-perf",
		winopts = {
			preview = {
				-- hidden = "hidden", -- Disable preview by default
			},
		},
		keymap = {
			builtin = {
				true,
				["<Esc>"] = "hide",
				["<c-space>"] = "toggle-preview",
			},
		},
		files = {
			prompt = "Files❯ ",
			multiprocess = true, -- run command in a separate process
			cwd_prompt = false,
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
			},
			actions = {
				["ctrl-q"] = actions.file_sel_to_qf,
			},
		},
		oldfiles = {
			prompt = "History❯ ",
			cwd_only = true,
			stat_file = true, -- verify files exist on disk
			include_current_session = true, -- include bufs from current session
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-old-files-history",
			},
			actions = {
				["ctrl-q"] = actions.file_sel_to_qf,
			},
		},
		buffers = {
			prompt = "Buffers❯ ",
			sort_lastused = true, -- sort buffers() by last used
			show_unloaded = true, -- show unloaded buffers
			cwd_only = true, -- buffers for the cwd only
			actions = {
				["ctrl-x"] = { fn = actions.buf_del, reload = true },
				["ctrl-q"] = actions.file_sel_to_qf,
			},
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-buffers",
			},
		},
		grep = {
			multiprocess = true, -- run command in a separate process
			-- rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
			rg_glob = true, -- default to glob parsing?
			glob_flag = "--iglob", -- for case sensitive globs use '--glob'
			glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
			},
			actions = {
				["ctrl-q"] = {
					fn = actions.file_edit_or_qf,
				},
			},
			winopts = { preview = { hidden = false } },
		},
		git = {
			branches = {
				prompt = "Branches❯ ",
				cmd = "git branch --all --color",
				preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
				actions = {
					["default"] = function(state)
						os.execute("git checkout " .. state[1])
					end,
					["ctrl-x"] = { fn = actions.git_branch_del, reload = true },
					["ctrl-a"] = { fn = actions.git_branch_add, field_index = "{q}", reload = true },
					["ctrl-d"] = function(state)
						vim.cmd("DiffviewOpen " .. state[1] .. " -- %")
					end,
					["ctrl-D"] = function(state)
						vim.cmd("DiffviewOpen " .. state[1])
					end,
					["ctrl-t"] = function(state)
						os.execute("git checkout --track " .. state[1])
					end,
				},
				-- If you wish to add branch and switch immediately
				-- cmd_add  = { "git", "checkout", "-b" },
				cmd_add = { "git", "branch" },
				-- If you wish to delete unmerged branches add "--force"
				-- cmd_del  = { "git", "branch", "--delete", "--force" },
				cmd_del = { "git", "branch", "--delete" },

				fzf_opts = {
					["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-branches",
				},
			},
		},
		lsp = {
			symbols = {

				winopts = { preview = { hidden = false } },
			},
		},
	})
	fzf.register_ui_select()
end

return M
