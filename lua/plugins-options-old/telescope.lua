local M = {}

function M.config()
	require("telescope").setup({
		extensions = {
			jsonfly = {
				mirror = true,
				layout_strategy = "vertical",
				layout_config = {
					mirror = true,
					preview_height = 0.65,
					prompt_position = "top",
				},
				key_exact_length = true,
			},
		},
	})
end

return M
