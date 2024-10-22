return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = require("plugins-options.mason").config
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  }
}
