return {
 {
     "nvim-treesitter/nvim-treesitter", 
-- branch = 'main',
 lazy = false,
 config=require("plugins.config.treesitter").config,
 build = ":TSUpdate"
 }

}
