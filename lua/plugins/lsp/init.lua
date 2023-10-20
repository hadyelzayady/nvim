return {
  {
    "neovim/nvim-lspconfig",
    config=require("plugins-options.lsp.lspconfig").config
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config=require("plugins-options.lsp.typescript-tools").config
  },
  {
    "williamboman/mason.nvim",
    config=require("plugins-options.lsp.mason").config
  },
  {
    'stevearc/conform.nvim',
    config=require("plugins-options.lsp.conform").config,
  },
  {
    'rmagatti/goto-preview',
    config = require("plugins-options.lsp.goto-preview").config
  },
  {
    'stevearc/aerial.nvim',
    config = require("plugins-options.lsp.aerial").config,
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  }
}
