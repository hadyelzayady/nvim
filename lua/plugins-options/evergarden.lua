local M = {}
function M.config()
	require 'evergarden'.setup(
		{
			transparent_background = false,
			variant = 'medium', -- 'hard'|'medium'|'soft'
			overrides = {
				DiffText = {
					bg = "#000000"
				}

			}, -- add custom overrides
		}
	)
	vim.cmd("colorscheme evergarden")
end

return M
