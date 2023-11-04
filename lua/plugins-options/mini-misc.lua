local M = {}
function M.config()
	require("mini.misc").setup(
		-- No need to copy this inside `setup()`. Will be used automatically.
		{
			-- Array of fields to make global (to be used as independent variables)
			make_global = { "setup_auto_root" },
		}
	)
	MiniMisc.setup_auto_root()
end

return M
