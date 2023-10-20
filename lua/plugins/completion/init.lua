return {
  {
    'echasnovski/mini.completion',
    version = false,
    config = require("plugins-options.completion.mini-completion").config
  },

  {
    "Exafunction/codeium.vim",
    event = { "InsertEnter" },
    config = function()
      require("config.keymaps").codium()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      { "<tab>",   function() require("luasnip").jump(1) end,   mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end,  mode = { "i", "s" } },
    },
    config = require("plugins-options.completion.luasnip").config
  }
}
