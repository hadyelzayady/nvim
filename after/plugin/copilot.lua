require("copilot").setup({
	filetypes = {
		sql = true,
	},
	should_attach = function()
		return true
	end,
	nes = {
		enabled = false,
		keymap = {
			accept_and_goto = "<leader>p",
			accept = false,
			dismiss = "<Esc>",
		},
	},
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
})
