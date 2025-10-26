return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"mikavilpas/blink-ripgrep.nvim",
			"Kaiser-Yang/blink-cmp-git",
			"alexandre-abrioux/blink-cmp-npm.nvim",
		},
		version = "1.*",
		event = "InsertEnter",
		-- build = "nix run .#build-plugin",
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
				kind_icons = require("ui.icons").icons.kinds,
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
				default = { "git", "npm", "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					sql = { "lsp", "snippets", "dadbod", "buffer" },
				},
				providers = {
					ripgrep = {
						module = "blink-ripgrep",
						name = "Ripgrep",
					},
					git = {
						module = "blink-cmp-git",
						name = "Git",
						-- only enable this source when filetype is gitcommit, markdown, or 'octo'
						enabled = function()
							return vim.tbl_contains({ "octo", "gitcommit", "markdown" }, vim.bo.filetype)
						end,
						--- @module 'blink-cmp-git'
						--- @type blink-cmp-git.Options
						opts = {},
					},
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					npm = {
						name = "npm",
						module = "blink-cmp-npm",
						async = true,
						-- optional - make blink-cmp-npm completions top priority (see `:h blink.cmp`)
						score_offset = 100,
						-- optional - blink-cmp-npm config
						---@module "blink-cmp-npm"
						---@type blink-cmp-npm.Options
						opts = {
							ignore = {},
							only_semantic_versions = true,
							only_latest_version = false,
						},
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
