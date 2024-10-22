return {
  {
    "stevearc/oil.nvim",
    cmd = { "Oil" },
    dependencies = { "echasnovski/mini.icons" },
    config = require("plugins-options.oil").config,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins-options.nvim-tree").config,
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    dependencies = {
      {
        "junegunn/fzf",
        build = function()
          vim.fn["fzf#install"]()
        end,
      }
    }
  },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("plugins-options.gx").config,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { 'echasnovski/mini.icons' },
    config = require("plugins-options.fzf-lua").config,
    cmd = { "FzfLua" }
  },
  {
    "echasnovski/mini.bufremove",
    version = false,
    keys = { { "<space>d", desc = "Delete Buffer" }, { "<space>D", desc = "Force Delete Buffer" } },
    config = require("plugins-options.mini-bufremove").config,
  },
  {
    'stevearc/aerial.nvim',
    event = "VeryLazy",
    config = require("plugins-options.aerial").config,
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = require("plugins-options.flash").keys,
    config = require("plugins-options.flash").config,
    vscode = true,
  },
}
