-- largefile.lua — minimal config for big files
vim.opt.shadafile = "NONE"

-- Disable matchparen, shada, spell, rplugin
vim.g.loaded_matchparen = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.did_load_filetypes = 1
vim.g.did_load_ftplugin = 1
vim.g.do_filetype_lua = 0
vim.g.did_indent_on = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_matchit = 1

-- General UI perf
vim.opt.foldmethod = "manual"
vim.opt.modelines = 0
vim.opt.hidden = true
vim.opt.updatetime = 3000
vim.opt.redrawtime = 10000
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.syntax = "off"
vim.opt.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.foldmethod = "manual"

-- Optional: disable Treesitter
pcall(function()
	vim.treesitter.stop()
end)
