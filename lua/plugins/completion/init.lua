return {
	{
		"Exafunction/codeium.vim",
		event = { "InsertEnter" },
		config = function()
      require("config.keymaps").codium()
		end,
	},
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies={
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "petertriho/cmp-git",
      'David-Kunz/cmp-npm',
      -- 'rcarriga/cmp-dap',
      "hrsh7th/cmp-path",
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
      'davidsierradz/cmp-conventionalcommits',
    },
    opts = require("plugins-options.cmp").opts,
    config = require("plugins-options.cmp").config
  },
  require("plugins.completion.luasnip")
}
