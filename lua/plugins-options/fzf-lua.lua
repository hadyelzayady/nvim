local M = {}

function M.config()
	local fzf = require("fzf-lua")
	local actions = require("fzf-lua.actions")
	fzf.setup({
		"max-perf",
		actions = {
			files = {
				["default"] = actions.file_edit_or_qf,
				["ctrl-s"] = actions.file_split,
				["ctrl-v"] = actions.file_vsplit,
				["ctrl-t"] = actions.file_tabedit,
				["ctrl-q"] = actions.file_sel_to_qf,
				["alt-l"] = actions.file_sel_to_ll,
			},
		},
		files = {
			prompt = "Files❯ ",
			multiprocess = true, -- run command in a separate process
			cwd_prompt = false,
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
			},
		},
		oldfiles = {
			prompt = "History❯ ",
			cwd_only = true,
			stat_file = true, -- verify files exist on disk
			include_current_session = true, -- include bufs from current session
		},
		buffers = {
			prompt = "Buffers❯ ",
			sort_lastused = true, -- sort buffers() by last used
			show_unloaded = true, -- show unloaded buffers
			cwd_only = true, -- buffers for the cwd only
			actions = {
				["ctrl-x"] = { fn = actions.buf_del, reload = true },
			},
		},
		grep = {
			multiprocess = true, -- run command in a separate process
			rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
			rg_glob = false, -- default to glob parsing?
			glob_flag = "--iglob", -- for case sensitive globs use '--glob'
			glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
			},
		},
		git = {
			branches = {
				prompt = "Branches❯ ",
				cmd = "git branch --all --color",
				preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
				actions = {
					["default"] = actions.git_switch,
					["ctrl-x"] = { fn = actions.git_branch_del, reload = true },
					["ctrl-a"] = { fn = actions.git_branch_add, field_index = "{q}", reload = true },
					["ctrl-d"] = function(state)
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
			},
		},
		lsp = {
			prompt_postfix = "❯ ", -- will be appended to the LSP label
			cwd_only = true, -- LSP/diagnostics for cwd only?
			async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
			git_icons = false,
			includeDeclaration = true, -- include current declaration in LSP context
			-- symbols = {
			-- 	async_or_timeout = true, -- symbols are async by default
			-- 	symbol_style = 1, -- style for document/workspace symbols
			-- 	symbol_icons = {
			-- 		File = icons.kinds.File,
			-- 		Module = icons.kinds.Module,
			-- 		Namespace = icons.kinds.Namespace,
			-- 		Package = icons.kinds.Package,
			-- 		Class = icons.kinds.Class,
			-- 		Method = icons.kinds.Method,
			-- 		Property = icons.kinds.Property,
			-- 		Field = icons.kinds.Field,
			-- 		Constructor = icons.kinds.Constructor,
			-- 		Enum = icons.kinds.Enum,
			-- 		Interface = icons.kinds.Interface,
			-- 		Function = icons.kinds.Function,
			-- 		Variable = icons.kinds.Variable,
			-- 		Constant = icons.kinds.Constant,
			-- 		String = icons.kinds.String,
			-- 		Number = icons.kinds.Number,
			-- 		Boolean = icons.kinds.Boolean,
			-- 		Array = icons.kinds.Array,
			-- 		Object = icons.kinds.Object,
			-- 		Key = icons.kinds.Key,
			-- 		Null = icons.kinds.Null,
			-- 		EnumMember = icons.kinds.EnumMember,
			-- 		Struct = icons.kinds.Struct,
			-- 		Event = icons.kinds.Event,
			-- 		Operator = icons.kinds.Operator,
			-- 		TypeParameter = icons.kinds.TypeParameter,
			-- 	},
		},
	})
	fzf.register_ui_select()
end
return M
