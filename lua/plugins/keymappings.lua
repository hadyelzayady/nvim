return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>n"] = { name = "+toggle" },
        ["<leader>nC"] = { name = "+Color" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>t"] = { name = "+terminal" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>r"] = { name = "+run/debug" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>m"] = { name = "+Misc" },
      })
    end,
  },
  {
    'anuvyklack/hydra.nvim',
    event = { "BufReadPre" },
    config = function(_, _)
      local hydra = require "hydra"
      local menus = require("plugins-options.hydra")
      hydra(menus.gitsigns_menu())
      hydra(menus.merge_conflict_menu())
      hydra(menus.dap_menu())
      -- hydra(quick_menu())
    end,
  }
}
