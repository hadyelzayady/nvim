vim.loader.enable()

_G.Config = {}

local gr = vim.api.nvim_create_augroup("custom-config", {})
Config.new_autocmd = function(event, pattern, callback, desc)
	local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
	vim.api.nvim_create_autocmd(event, opts)
end
require("treesitter")
require("options")
require("keymaps")
require("autocmd")
