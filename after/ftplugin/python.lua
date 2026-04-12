-- Python filetype settings
local settings = require("ftplugin.settings")
settings.four_space()
vim.opt_local.indentkeys:append("0=:")

-- Enable treesitter for Python
vim.treesitter.language.add("python")