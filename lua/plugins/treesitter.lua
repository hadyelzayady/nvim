return {
  {
    "nvim-treesitter/nvim-treesitter",
    build="TSUpdate",
    config=require("plugins-options.treesitter").config
  }
}
