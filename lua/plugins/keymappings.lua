return {
    { "folke/which-key.nvim",
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
              ["t"] = { name = "+toggle" },
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
        end, }
}
