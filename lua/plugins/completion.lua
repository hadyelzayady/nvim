local no_pre_select_filetypes = { "DressingInput", "minifiles" }
return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets", "mikavilpas/blink-ripgrep.nvim" },
		version = "*",
		opts = {
			keymap = {
				preset = "enter",
				["<c-g>"] = {
					function()
						-- invoke manually, requires blink >v0.8.0
						require("blink-cmp").show({ providers = { "ripgrep" } })
					end,
				},
			},
			completion = {
				list = {
					selection = {
						auto_insert = false,
						preselect = function(ctx)
							local filetype = vim.bo[ctx.bufnr].filetype
							return ctx.mode ~= "cmdline"
								and not require("blink.cmp").snippet_active({ direction = 1 })
								and not vim.tbl_contains(no_pre_select_filetypes, filetype)
						end,
					},
				},
				menu = {
					draw = {
						treesitter = { "lsp" },
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", "source_name" } },
					},
				},
				accept = {
					-- auto_brackets = {
					-- 	kind_resolution = {
					-- 		enabled = true,
					-- 		blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
					-- 	},
					-- 	semantic_token_resolution = {
					-- 		enabled = true,
					-- 		blocked_filetypes = { "typescript" },
					-- 	},
					-- },
				},
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				cmdline = {},
				providers = {
					ripgrep = {
						module = "blink-ripgrep",
						name = "Ripgrep",
					},
				},
			},

			appearance = {
				kind_icons = require("utils.ui-components").icons.kinds,
			},
		},
		opts_extend = { "sources.default" },
	},
}
