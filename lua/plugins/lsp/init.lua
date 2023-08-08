return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Setup language servers.
			require("plugins.lsp.lint").setup()
			require("plugins.lsp.servers_configs").setup()
			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			require("config.keymaps").lsp_global_setup()

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					require("config.keymaps").on_attach_setup(ev)
				end,
			})
		end,
		dependencies = {
			"yioneko/nvim-vtsls",
		},
	},
	{
		"yioneko/nvim-vtsls",
		opts = require("plugins-options.vtsls"),
		config = function(_, opts)
			require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended
			require("vtsls").config(opts)
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"mhartington/formatter.nvim",
		cmd = { "Format", "FormatWrite", "FormatWriteLock", "FormatLock" },
		opts = require("plugins-options.formatter"),
	},
	{
		"stevearc/aerial.nvim",
		opts = require("plugins-options.aerial"),
		lazy = true,
		cmd = { "AerialToggle", "AerialNavToggle" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
