return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "nvim-java/nvim-java" },
		lazy = false,
		config = function()
			require('lspconfig').jdtls.setup({})
		end
	},
	{
		'nvim-java/nvim-java',
		lazy = false,
		config = function()
			require('java').setup()
		end

	}
}
