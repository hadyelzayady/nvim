return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "mikavilpas/blink-ripgrep.nvim" },
		version = "1.*",
		event = "InsertEnter",
		build = "cargo build --release",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<c-g>"] = {
					function()
						require("blink-cmp").show({ providers = { "ripgrep" } })
					end,
				},
				["<c-l>"] = {
					function()
						require("blink-cmp").show({ providers = { "lsp" } })
					end,
				},
			},
			appearance = {
				kind_icons = require("utils.ui-components").icons.kinds,
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = true },
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1, "source_name" },
						},
					},
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					ripgrep = {
						module = "blink-ripgrep",
						name = "Ripgrep",
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
