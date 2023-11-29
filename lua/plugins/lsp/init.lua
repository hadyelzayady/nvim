local function extend_or_override(config, custom, ...)
	if type(custom) == "function" then
		config = custom(config, ...) or config
	elseif custom then
		config = vim.tbl_deep_extend("force", config, custom) --[[@as table]]
	end
	return config
end

return {
	{
		"neovim/nvim-lspconfig",
		config = require("plugins-options.lsp.lspconfig").config,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
		config = require("plugins-options.lsp.typescript-tools").config,
	},
	{
		"williamboman/mason.nvim",
		config = require("plugins-options.lsp.mason").config,
	},
	{
		"stevearc/conform.nvim",
		keys = { "<space>f" },
		config = require("plugins-options.lsp.conform").config,
	},
	{
		"rmagatti/goto-preview",
		keys = { "gp" },
		config = require("plugins-options.lsp.goto-preview").config,
	},
	{
		"stevearc/aerial.nvim",
		config = require("plugins-options.lsp.aerial").config,
		cmd = { "AerialToggle", "AerialNavToggle" },
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = require("plugins-options.lsp.servers-configs.jdtls").config,
		opts = require("plugins-options.lsp.servers-configs.jdtls").opts,
	},
	{
		"zeioth/garbage-day.nvim",
		enabled = false,
		opts = {
			aggressive_mode = false,
			excluded_lsp_clients = {
				"jdtls",
			},
			grace_period = (60 * 5),
			wakeup_delay = 3000,
			notifications = false,
			retries = 5,
			timeout = 200,
		},
	},
}
