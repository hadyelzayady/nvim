local ok, mod = pcall(require, "codecompanion")

if ok and mod.setup then
	mod.setup({
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
		display = {
			chat = {
				show_header_separator = true, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
				show_settings = false, -- Show LLM settings at the top of the chat buffer?
				show_token_count = true, -- Show the token count for each response?
				show_tools_processing = true, -- Show the loading message when tools are being executed?
			},
		},
	})
end
