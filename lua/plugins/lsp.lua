return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = require("plugins-options.mason").config
  },
  {
    'neovim/nvim-lspconfig',
    config = require("plugins-options.lsp.lspconfig").config
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  {
    "yioneko/nvim-vtsls",
    event = "VeryLazy"
  },
  {
    "antosha417/nvim-lsp-file-operations",
    event = "VeryLazy",
    requires = {
      "nvim-lua/plenary.nvim",
      -- Uncomment whichever supported plugin(s) you use
      "nvim-tree/nvim-tree.lua",
      -- "nvim-neo-tree/neo-tree.nvim",
      -- "simonmclean/triptych.nvim"
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  }
}
