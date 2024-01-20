local M = {}

function M.config()
	require("true-zen").setup({
		-- your config goes here
		-- or just leave it empty :)
	})
	require("config.keymaps").zen_setup()
end

return M
