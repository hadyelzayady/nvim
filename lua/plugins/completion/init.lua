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
}
