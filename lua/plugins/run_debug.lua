return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"igorlfs/nvim-dap-view",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		---@module 'dap-view'
		---@type dapview.Config
		opts = {},
	},
}
