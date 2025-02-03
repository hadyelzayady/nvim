local M = {}
function M.config()
	require("minuet").setup({
		provider_options = {
			openai = {
				model = "gpt-4o-mini",
				-- system = "see [Prompt] section for the default value",
				-- few_shots = "see [Prompt] section for the default value",
				-- chat_input = "See [Prompt Section for default value]",
				stream = true,
				api_key = "OPENAI_API_KEY",
			},
		},
		provider = "openai",
		virtualtext = {
			auto_trigger_ft = {},
			keymap = {
				-- accept whole completion
				accept = "<A-A>",
				-- accept one line
				accept_line = "<A-a>",
				-- accept n lines (prompts for number)
				accept_n_lines = "<A-z>",
				-- Cycle to prev completion item, or manually invoke completion
				prev = "<A-[>",
				-- Cycle to next completion item, or manually invoke completion
				next = "<A-]>",
				dismiss = "<A-e>",
			},
		},
	})
end
return M
