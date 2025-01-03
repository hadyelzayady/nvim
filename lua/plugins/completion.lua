return {
  {
    'saghen/blink.cmp',
	event="InsertEnter",
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '*',
    opts = {
      keymap = { preset = 'enter' },
      completion = {
        list = {
          selection = 'preselect',
        }
      },

      signature = { enabled = true },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = {}
	},
    },
    opts_extend = { "sources.default" }
  },
}
