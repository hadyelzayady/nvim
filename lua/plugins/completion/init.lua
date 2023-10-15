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
    enabled = false,
    event = "InsertEnter",
    dependencies = {
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
  require("plugins.completion.luasnip"),
  {
    "petertriho/cmp-git",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = require("plugins-options.cmp-git").config,
    lazy = true
  },
  {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    config = require("plugins-options.coq").config(),
    dependencies = {
      { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
      {
        'ms-jpq/coq.thirdparty',
        branch = '3p',
        config = require("plugins-options.coq").config_3p,
      },
    }
  }
}
