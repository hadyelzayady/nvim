return {
	{
		-- better search
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
			require("config.keymaps").hlslens_setup()
		end,
	},
	{
		"tpope/vim-abolish",
	},
	{
		"eugen0329/vim-esearch",
	},
	{
		"AckslD/muren.nvim",
		opts = require("plugins-options.muren"),
		cmd = { "MurenToggle", "MurenOpen", "MurenUnique", "MurenFresh" },
	},
}
