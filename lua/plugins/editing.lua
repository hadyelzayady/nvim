return {
  {
    "max397574/better-escape.nvim",
    config = require("plugins-options.better-escape").config,
    event = "InsertEnter",
  },
  {
    "echasnovski/mini.surround",
    version = false,
    config = require("plugins-options.mini-surround").config,
    keys = { { "s", mode = { "v", "n" } } },
  },
  -- {
  --   "echasnovski/mini.pairs",
  --   event = "InsertEnter",
  --   enabled = false,
  --   version = false,
  --   config = require("plugins-options.mini-pairs").config,
  -- },
  -- {
  --   "altermo/ultimate-autopair.nvim",
  --   event = { "InsertEnter", "CmdlineEnter" },
  --   branch = "v0.6", --recommended as each new version will have breaking changes
  --   opts = function()
  --     return {
  --
  --       fastwarp = {
  --
  --         map = "<D-e>", --string or table
  --       },
  --       --Config goes here
  --     }
  --   end,
  -- },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", cmd = { "Telescope" } },
    config = require("plugins-options.text-case").config,
    keys = { "ga", { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    },
    cmd = {
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
  },

  {
    "echasnovski/mini.splitjoin",
    version = false,
    keys = { "gs", "gS", "gJ" },
    config = require("plugins-options.mini-splitjoin").config,
  },
  {
    "echasnovski/mini.ai",
    version = false,
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- no need to load the plugin, since we only need its queries
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        end,
      },
    },
    config = require("plugins-options.mini-ai").config,
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },

  {
    "lambdalisue/vim-suda",
    cmd = { "SudoWrite", "SudaRead" }
  },
  {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = require("plugins-options.neorg").config
  }
}
