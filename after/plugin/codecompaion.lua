require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
	},

	extensions = {
		history = {

			enabled = true,
		},
	},
})
