return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config=function()
      require("tokyonight").setup()
      vim.cmd[[colorscheme tokyonight-night]]
    end
  },
  {
    'echasnovski/mini.cursorword',
    version = false,
    config = require("plugins-options.mini-cursorword").config
  },{

    'echasnovski/mini.indentscope',
    version = false,
    config = require("plugins-options.mini-indentscope").config
  },
  {
    'echasnovski/mini.hipatterns',
    version = false,
    config = require("plugins-options.mini-hipatterns").config
  },
  {
    'stevearc/dressing.nvim',
    config = require("plugins-options.dressing").config
  },
	{
		"dhruvasagar/vim-zoom",
	},
}
