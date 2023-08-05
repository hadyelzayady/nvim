return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    opts = require("plugins-options.hlchunk"),
    dependencies={
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "stevearc/dressing.nvim",
    opts = require("plugins-options.dressing")
  },
  {
     -- TODO: To be removed after shellRaining/hlchunk hlchunk is fixed
    "yaocccc/nvim-hlchunk"
  }
}
