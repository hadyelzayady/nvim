return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', { 'L3MON4D3/LuaSnip', version = 'v2.*' }, },
    version = '*',
    opts = {
      keymap = { preset = 'enter' },
      completion = {
        list = {
          selection = 'preselect',
        }
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true },
      sources = {
        default = { 'lsp', 'path', 'luasnip', 'snippets', 'buffer' },
        -- By default, we choose providers for the cmdline based on the current cmdtype
        -- You may disable cmdline completions by replacing this with an empty table
        cmdline = function()
          -- local type = vim.fn.getcmdtype()
          -- -- Search forward and backward
          -- if type == '/' or type == '?' then return { 'buffer' } end
          -- -- Commands
          -- if type == ':' then return { 'cmdline' } end
          return {}
        end,
      },
    },
    opts_extend = { "sources.default" }
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
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
    config = require("plugins-options.completion.luasnip").config,
  },
}
