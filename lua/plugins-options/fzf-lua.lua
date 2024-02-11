local M = {}

function M.config()
	local actions = require("fzf-lua.actions")
	local fzf = require("fzf-lua")
	local icons = require("utils.ui-components").icons
	fzf.setup({
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
		previewers = {
			builtin = {
				syntax = true, -- preview syntax highlight?
				syntax_limit_l = 500, -- syntax limit (lines), 0=nolimit
			},
		},
		files = {
			prompt = "Files❯ ",
			multiprocess = true, -- run command in a separate process
			git_icons = true, -- show git icons?
			file_icons = true, -- show file icons?
			color_icons = true, -- colorize file|git icons
			fd_opts = "--color=never --type f --hidden --follow --exclude .git",
			cwd_prompt = false,
			cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
			cwd_prompt_shorten_val = 1, -- shortened path parts length
			actions = {
				["default"] = function(selected, opts)
					vim.cmd("silent! !fre --add " .. selected[1])
					fzf.actions.file_edit(selected, opts)
				end,
			},
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
			},
		},
		git = {
			branches = {
				prompt = "Branches❯ ",
				cmd = "git branch --sort=-committerdate --all --color",
				preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
				actions = {
					["default"] = actions.git_switch,
					["ctrl-d"] = function(state)
						vim.cmd("DiffviewOpen " .. state[1])
					end,
					["ctrl-t"] = function(state)
						os.execute("git checkout --track " .. state[1])
					end,
				},
			},
			icons = {
				["M"] = { icon = icons.git.modified, color = "yellow" },
				["D"] = { icon = icons.git.removed, color = "red" },
				["A"] = { icon = icons.git.added, color = "green" },
				["R"] = { icon = icons.git.renamed, color = "yellow" },
				["C"] = { icon = icons.git.conflict, color = "yellow" },
				["T"] = { icon = icons.git.staged, color = "magenta" },
				["?"] = { icon = icons.git.untracked, color = "magenta" },
			},
		},
		grep = {
			multiprocess = true, -- run command in a separate process
			git_icons = true, -- show git icons?
			file_icons = true, -- show file icons?
			color_icons = true, -- colorize file|git icons
			rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
			rg_glob = false, -- default to glob parsing?
			glob_flag = "--iglob", -- for case sensitive globs use '--glob'
			glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
			actions = {
				["ctrl-g"] = { actions.grep_lgrep },
			},
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
			},
		},
		oldfiles = {
			prompt = "History❯ ",
			cwd_only = true,
			stat_file = true, -- verify files exist on disk
			include_current_session = true, -- include bufs from current session
			actions = {
				["default"] = function(selected, opts)
					vim.cmd("silent! !fre --add " .. selected[1])
					fzf.actions.file_edit(selected, opts)
				end,
			},
		},
		buffers = {
			prompt = "Buffers❯ ",
			file_icons = true, -- show file icons?
			color_icons = true, -- colorize file|git icons
			sort_lastused = true, -- sort buffers() by last used
			show_unloaded = true, -- show unloaded buffers
			cwd_only = true, -- buffers for the cwd only
			cwd = nil, -- buffers list for a given dir
			actions = {
				["ctrl-x"] = { fn = actions.buf_del, reload = true },
			},
		},
		lsp = {
			prompt_postfix = "❯ ", -- will be appended to the LSP label
			-- to override use 'prompt' instead
			cwd_only = true, -- LSP/diagnostics for cwd only?
			async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
			file_icons = true,
			git_icons = false,
			-- The equivalent of using `includeDeclaration` in lsp buf calls, e.g:
			-- :lua vim.lsp.buf.references({includeDeclaration = false})
			includeDeclaration = true, -- include current declaration in LSP context
			-- settings for 'lsp_{document|workspace|lsp_live_workspace}_symbols'
			symbols = {
				async_or_timeout = true, -- symbols are async by default
				symbol_style = 1, -- style for document/workspace symbols
				symbol_icons = {
					File = icons.kinds.File,
					Module = icons.kinds.Module,
					Namespace = icons.kinds.Namespace,
					Package = icons.kinds.Package,
					Class = icons.kinds.Class,
					Method = icons.kinds.Method,
					Property = icons.kinds.Property,
					Field = icons.kinds.Field,
					Constructor = icons.kinds.Constructor,
					Enum = icons.kinds.Enum,
					Interface = icons.kinds.Interface,
					Function = icons.kinds.Function,
					Variable = icons.kinds.Variable,
					Constant = icons.kinds.Constant,
					String = icons.kinds.String,
					Number = icons.kinds.Number,
					Boolean = icons.kinds.Boolean,
					Array = icons.kinds.Array,
					Object = icons.kinds.Object,
					Key = icons.kinds.Key,
					Null = icons.kinds.Null,
					EnumMember = icons.kinds.EnumMember,
					Struct = icons.kinds.Struct,
					Event = icons.kinds.Event,
					Operator = icons.kinds.Operator,
					TypeParameter = icons.kinds.TypeParameter,
				},
			},
		},
	})

	fzf.register_ui_select()
end
return M
