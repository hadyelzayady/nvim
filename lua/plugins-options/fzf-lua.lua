local M = {}

function M.config()
	local actions = require("fzf-lua.actions")
	local fzf = require("fzf-lua")
	local icons = require("utils.ui-components").icons
	require("fzf-lua").setup({
		"default",
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
			cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
			cwd_prompt_shorten_val = 1, -- shortened path parts length
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
			},
			-- formatter = "path.filename_first",
		},
		oldfiles = {
			prompt = "History❯ ",
			cwd_only = true,
			stat_file = true, -- verify files exist on disk
			include_current_session = true, -- include bufs from current session
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

		winopts = {
			-- -- default     = 'bat',           -- override the default previewer?
			-- -- default uses the 'builtin' previewer
			-- border = "border", -- border|noborder, applies only to
			-- -- native fzf previewers (bat/cat/git/etc)
			-- wrap = "nowrap", -- wrap|nowrap
			-- hidden = "nohidden", -- hidden|nohidden
			-- vertical = "down:45%", -- up|down:size
			-- horizontal = "right:60%", -- right|left:size
			-- layout = "flex", -- horizontal|vertical|flex
			-- flip_columns = 120, -- #cols to switch to horizontal on flex
			-- -- Only used with the builtin previewer:
			-- title = true, -- preview border title (file/buf)?
			-- title_pos = "center", -- left|center|right, title alignment
			-- scrollbar = "float", -- `false` or string:'float|border'
			-- -- float:  in-window floating border
			-- -- border: in-border chars (see below)
			-- scrolloff = "-2", -- float scrollbar offset from right
			-- -- applies only when scrollbar = 'float'
			-- scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
			-- -- applies only when scrollbar = 'border'
			-- delay = 100, -- delay(ms) displaying the preview
			-- prevents lag on fast scrolling
			preview = { -- builtin previewer window options
				number = true,
				relativenumber = false,
				cursorline = true,
				cursorlineopt = "both",
				cursorcolumn = true,
				signcolumn = "no",
				list = false,
				foldenable = false,
				foldmethod = "manual",
			},
		},
	})

	fzf.register_ui_select()
end
return M
