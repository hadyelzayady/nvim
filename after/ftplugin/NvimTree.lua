vim.keymap.set(
	"n",
	"A",
	require("plugins.config.nvimtree").toggle_width_adaptive,
	{ desc = "Toggle Adaptive Width", buffer = true }
)

vim.opt_local.statusline=" "
