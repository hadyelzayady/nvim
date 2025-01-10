vim.keymap.set(
	"n",
	"A",
	require("plugins-options.nvim-tree").toggle_width_adaptive,
	{ desc = "Toggle Adaptive Width", buffer = true }
)
