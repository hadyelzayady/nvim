local M = {}

function M.config()
	-- default configuration
	require("illuminate").configure({
		providers = {
			"lsp",
			"treesitter",
			"regex"
		},
		delay = 150,
		filetypes_denylist = {
			"fugitive",
			"NeogitStatus",
			"NvimTree",
		},
		under_cursor = true,
		large_file_cutoff = 1000,
		min_count_to_highlight = 1,
	})
end

return M
