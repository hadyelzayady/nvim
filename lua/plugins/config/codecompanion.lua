local M = {}
local function getCommitPrompt()
	return string.format(
		[[Generate a clear and professional commit message following the Conventional Commits standard (type(scope): description) based on the following code changes.

Use correct types: feat, fix, chore, docs, refactor, test, style.

Write the description in present tense, lowercase, and under 70 characters if possible.

If the change introduces a breaking change, add a BREAKING CHANGE: section explaining it.

Summarize multiple changes if needed, prioritizing the most important ones.
```diff
%s
```
]],
		vim.fn.system("git diff --no-ext-diff --staged")
	)
end
M.opts = {
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
	},
	prompt_library = {
		["Generate a Commit Message"] = {
			strategy = "inline",
			description = "Generate a commit message",
			opts = {
				index = 10,
				is_default = true,
				is_slash_cmd = true,
				short_name = "commit",
				user_prompt = false,
				auto_submit = true,
				placement = "before",
			},
			prompts = {
				{
					role = "user",
					content = getCommitPrompt,
					opts = {
						contains_code = true,
					},
				},
			},
		},
		["Generate a Commit Message With Chat"] = {
			strategy = "chat",
			description = "Generate a commit message",
			opts = {
				index = 10,
				is_default = true,
				is_slash_cmd = true,
				short_name = "commitChat",
				user_prompt = false,
				auto_submit = true,
			},
			prompts = {
				{
					role = "user",
					content = getCommitPrompt,
					opts = {
						contains_code = true,
					},
				},
			},
		},
	},
	extensions = {
		history = {
			enabled = true,
			opts = {
				-- Keymap to open history from chat buffer (default: gh)
				keymap = "gh",
				-- Keymap to save the current chat manually (when auto_save is disabled)
				save_chat_keymap = "sc",
				-- Save all chats by default (disable to save only manually using 'sc')
				auto_save = true,
				-- Number of days after which chats are automatically deleted (0 to disable)
				expiration_days = 0,
				-- Picker interface (auto resolved to a valid picker)
				picker = "telescope", --- ("telescope", "snacks", "fzf-lua", or "default")
				---Optional filter function to control which chats are shown when browsing
				chat_filter = nil, -- function(chat_data) return boolean end
				-- Customize picker keymaps (optional)
				picker_keymaps = {
					rename = { n = "r", i = "<M-r>" },
					delete = { n = "d", i = "<M-d>" },
					duplicate = { n = "<C-y>", i = "<C-y>" },
				},
				---Automatically generate titles for new chats
				auto_generate_title = true,
				title_generation_opts = {
					---Adapter for generating titles (defaults to current chat adapter)
					adapter = nil, -- "copilot"
					---Model for generating titles (defaults to current chat model)
					model = nil, -- "gpt-4o"
					---Number of user prompts after which to refresh the title (0 to disable)
					refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
					---Maximum number of times to refresh the title (default: 3)
					max_refreshes = 3,
					format_title = function(original_title)
						-- this can be a custom function that applies some custom
						-- formatting to the title.
						return original_title
					end,
				},
				---On exiting and entering neovim, loads the last chat on opening chat
				continue_last_chat = false,
				---When chat is cleared with `gx` delete the chat from history
				delete_on_clearing_chat = false,
				---Directory path to save the chats
				dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
				---Enable detailed logging for history extension
				enable_logging = false,

				-- Summary system
				summary = {
					-- Keymap to generate summary for current chat (default: "gcs")
					create_summary_keymap = "gcs",
					-- Keymap to browse summaries (default: "gbs")
					browse_summaries_keymap = "gbs",

					generation_opts = {
						adapter = nil, -- defaults to current chat adapter
						model = nil, -- defaults to current chat model
						context_size = 90000, -- max tokens that the model supports
						include_references = true, -- include slash command content
						include_tool_outputs = true, -- include tool execution results
						system_prompt = nil, -- custom system prompt (string or function)
						format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
					},
				},

				-- Memory system (requires VectorCode CLI)
				memory = {
					-- Automatically index summaries when they are generated
					auto_create_memories_on_summary_generation = true,
					-- Path to the VectorCode executable
					vectorcode_exe = "vectorcode",
					-- Tool configuration
					tool_opts = {
						-- Default number of memories to retrieve
						default_num = 10,
					},
					-- Enable notifications for indexing progress
					notify = true,
					-- Index all existing memories on startup
					-- (requires VectorCode 0.6.12+ for efficient incremental indexing)
					index_on_startup = false,
				},
			},
		},
	},
}
return M
