local M = {}
local coq_settings = {
	auto_start = true,
	display = {
		ghost_text = {
			context = {
				" 〈 ",
				" 〉",
			},
			enabled = true,
			highlight_group = "Comment",
		},
		icons = {
			aliases = {
				Conditional = "Keyword",
				Float = "Number",
				Include = "Property",
				Label = "Keyword",
				Member = "Property",
				Repeat = "Keyword",
				Structure = "Struct",
				Type = "TypeParameter",
			},
			mappings = require("utils.ui-components").icons.kinds,
			mode = "long",
			spacing = 1,
		},

		mark_highlight_group = "Pmenu",

		preview = {
			border = "rounded",
			enabled = true,
			positions = {
				east = 4,
				north = 1,
				south = 2,
				west = 3,
			},
			resolve_timeout = 0.09,
			x_max_len = 88,
		},

		pum = {
			-- ellipsis= …
			fast_close = true,
			kind_context = {
				" [",
				"]",
			},
			source_context = {
				"「",
				"」",
			},

			x_max_len = 66,
			x_truncate_len = 12,
			y_max_len = 16,
			y_ratio = 0.3,
		},
		time_fmt = "%Y-%m-%d %H:%M",

		statusline = {
			helo = true,
		},
	},
	completion = {
		always = true,
		replace_prefix_threshold = 3,
		replace_suffix_threshold = 2,
		skip_after = {},
		smart = true,
	},
	clients = {
		buffers = {
			always_on_top = false,
			enabled = true,
			match_syms = false,
			parent_scope = " ⇊",
			same_filetype = false,
			short_name = "BUF",
			weight_adjust = 0,
		},
		lsp = {
			always_on_top = nil,
			enabled = true,
			resolve_timeout = 0.06,
			short_name = "LSP",
			weight_adjust = 0.5,
		},
		paths = {
			always_on_top = false,
			enabled = true,
			path_seps = {},
			preview_lines = 6,
			resolution = {
				"cwd",
				"file",
			},
			short_name = "PATH",
			weight_adjust = 0,
		},

		registers = {
			always_on_top = false,
			enabled = true,
			lines = {},
			match_syms = false,
			max_yank_size = 8888,
			register_scope = " ⇉ ",
			short_name = "REG",
			weight_adjust = 0,
			words = { "0" },
		},

		snippets = {
			always_on_top = false,
			enabled = true,
			short_name = "SNIP",
			user_path = nil,
			warn = {
				"missing",
				"outdated",
			},
			weight_adjust = 0.1,
		},

		tabnine = {
			always_on_top = false,
			enabled = false,
			short_name = "T9",
			weight_adjust = -0.1,
		},

		tags = {
			always_on_top = false,
			enabled = false,
			parent_scope = " ⇊",
			path_sep = " ⇉ ",
			short_name = "TAG",
			weight_adjust = 0.1,
		},

		third_party = {
			always_on_top = nil,
			enabled = true,
			short_name = "3P",
			weight_adjust = 0,
		},

		tmux = {
			all_sessions = true,
			always_on_top = false,
			enabled = false,
			match_syms = false,
			parent_scope = " ⇊",
			path_sep = " ⇉ ",
			short_name = "TMUX",
			weight_adjust = -0.1,
		},

		tree_sitter = {
			always_on_top = false,
			enabled = true,
			path_sep = " ⇊",
			short_name = "TS",
			slow_threshold = 0.168,
			weight_adjust = 0.1,
		},
	},
	keymap = {
		bigger_preview = "<c-k>",
		eval_snips = "True",
		jump_to_mark = "<c-h>",
		manual_complete = "<c-space>",
		manual_complete_insertion_only = false,
		pre_select = true,
		recommended = false,
		["repeat"] = nil,
	},

	limits = {
		completion_auto_timeout = 0.088,
		completion_manual_timeout = 0.66,

		download_retries = 6,
		download_timeout = 66.0,

		idle_timeout = 1.88,
		tokenization_limit = 999,
	},

	match = {
		exact_matches = 2,
		fuzzy_cutoff = 0.6,
		look_ahead = 2,
		max_results = 33,
		unifying_chars = {
			"_",
			"-",
		},
	},
	weights = {
		edit_distance = 1.5,
		prefix_matches = 2.0,
		proximity = 0.5,
		recency = 1.0,
	},

	xdg = true,
}

function M.config()
	vim.g.coq_settings = coq_settings
	require("config.keymaps").completion_keymaps()
end

function M.config_3p()
	require("coq_3p")({
		{ src = "nvimlua", short_name = "nLUA", config_only = true },
		{ src = "codeium", short_name = "COD" },
		{
			src = "repl",
			sh = "zsh",
			shell = { p = "perl", n = "node" },
			max_lines = 99,
			deadline = 500,
			unsafe = { "rm", "poweroff", "mv" },
		},
		{ src = "bc", short_name = "MATH", precision = 6 },
		{ src = "vim_dadbod_completion", short_name = "DB" },
		{ src = "dap" },
	})
end

return M
