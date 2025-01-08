local no_pre_select_filetypes = { "DressingInput", "minifiles" }
return {
	{
		'saghen/blink.cmp',
		event = "InsertEnter",
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '*',
		opts = {
			keymap = { preset = 'enter' },
			completion = {
				list = {
					selection = {
						auto_insert = false,
						preselect = function(ctx)
							local filetype = vim.bo[ctx.bufnr].filetype
							return ctx.mode ~= 'cmdline' and not require('blink.cmp').snippet_active({ direction = 1 }) and
								not vim.tbl_contains(no_pre_select_filetypes, filetype)
						end,
					}
				}
			},

			signature = { enabled = true },
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
				cmdline = {}
			},
		},
		opts_extend = { "sources.default" }
	},
}
