return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup({
        disable_filetype = { "TelescopePrompt" },
        disable_in_macro = false,       -- disable when recording or executing a macro
        disable_in_visualblock = false, -- disable hen insert after visual block mode
        ignored_next_char = [=[[%%%%'%[%"%.]]=],
        enable_moveright = true,
        enable_afterquote = true,         -- add bracket pairs after quote
        enable_check_bracket_line = true, --- check bracket in same line
        enable_bracket_in_quote = true,   --
        check_ts = false,
        map_bs = true,
        map_cr = true
      })
      -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      -- local cmp = require('cmp')
      -- cmp.event:on(
      --   'confirm_done',
      --   cmp_autopairs.on_confirm_done()
      -- )
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end
  },
  {
    "axelvc/template-string.nvim",
    ft = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' }, -- filetypes where the plugin is active
    opts=require("plugins-options.template-string")
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  {
    "Wansmer/treesj",
    keys = { "gs" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = require("plugins-options.treesj")
  },
  {
    "smjonas/live-command.nvim",
    opts = require("plugins-options.live-command"),
    config = function (_,opts)
      require("live-command").setup(opts)
    end
  },
}
