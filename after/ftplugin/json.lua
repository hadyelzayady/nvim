-- JSON filetype settings
local settings = require("ftplugin.settings")
settings.two_space_no_expand()
vim.opt_local.foldmethod = "indent"
vim.treesitter.language.add("json")