return {
	{
		"b0o/schemastore.nvim",
	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = true,
		-- do not use config as nvim-java will break if you use config
		-- config = require("plugins-options.mason").config,
	},
}
