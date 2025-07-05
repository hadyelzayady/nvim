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
}
return M
