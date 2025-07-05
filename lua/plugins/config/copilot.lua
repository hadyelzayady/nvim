local M = {}
M.opts = {
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<Tab>", -- Accept suggestion
			next = "<C-j>", -- Next suggestion
			prev = "<C-k>", -- Previous suggestion
			dismiss = "<C-x>", -- Dismiss suggestion
		},
	},
	-- copilot_node_command = ""
}
return M
