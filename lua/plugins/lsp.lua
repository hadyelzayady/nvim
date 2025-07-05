return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true, -- or "true" for always on
				display = {
					statusline = {
						helo = false,
					},
				},
			}
			require("plugins.config.coq_3p").config()
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		---@diagnostic disable-next-line: different-requires
		opts = require("plugins.config.conform").opts,
	},
}
