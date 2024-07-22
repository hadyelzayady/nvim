local M = {}

function M.config()
	require("better_escape").setup({
		timeout = vim.o.timeoutlen,
		default_mappings = false,
		mappings = {
			i = {
				--  first_key[s]
				j = {
					--  second_key[s]
					k = "<Esc>",
				},
			},
			c = {
				j = {
					k = "<Esc>",
				},
			},
			t = {
				j = {
					k = "<Esc>",
				},
			},
			v = {
				j = {
					k = "<Esc>",
				},
			},
			s = {
				j = {
					k = "<Esc>",
				},
			},
		},
	})
end
return M
