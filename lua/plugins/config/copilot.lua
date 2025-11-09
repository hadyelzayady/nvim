local M = {}
M.opts = {
	-- nes = {
	-- 	enabled = true,
	-- 	keymap = {
	-- 		accept_and_goto = "<leader>p",
	-- 		accept = false,
	-- 		dismiss = "<Esc>",
	-- 	},
	-- },
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
	copilot_node_command = vim.fn.expand("$HOME") .. "/.local/state/fnm_multishells/77211_1762682456759/bin/node", -- Node.js version must be > 20
}
return M
