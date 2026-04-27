vim.g.coq_settings = {
	auto_start = true, -- if you want to start COQ at startup
	clients = {
		lsp = {
			always_on_top = {},
		},
	},
	completion = { skip_after = {
		"{",
		"}",
		"[",
		"]",
	} },
	keymap = {
		pre_select = true,
	},
	display = {
		pum = {
			y_max_len = 8,
		},
		statusline = { helo = false },
		preview = {
			positions = {
				north = 1,
				south = 4,
				west = 3,
				east = 2,
			},
		},
	},
}

vim.cmd("COQnow")
