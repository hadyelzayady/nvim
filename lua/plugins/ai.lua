return {
	{
		"Kurama622/llm.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
		cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
		config = function()
			local tools = require("llm.common.tools")
			require("llm").setup({
				url = "https://models.inference.ai.azure.com/chat/completions",
				model = "gpt-4o",
				api_type = "openai",

				prompt = "You are a helpful assistant.",

				prefix = {
					user = { text = "😃 ", hl = "Title" },
					assistant = { text = "⚡ ", hl = "Added" },
				},

				style = "float", -- right | left | above | below | float
				app_handler = {
					OptimizeCode = {
						handler = tools.side_by_side_handler,
						-- opts = {
						--   streaming_handler = local_llm_streaming_handler,
						-- },
					},
					TestCode = {
						handler = tools.side_by_side_handler,
						prompt = [[ Write some test cases for the following code, only return the test cases.
            Give the code content directly, do not use code blocks or other tags to wrap it. ]],
						opts = {
							right = {
								title = " Test Cases ",
							},
						},
					},
					OptimCompare = {
						handler = tools.action_handler,
						-- opts = {
						-- 	fetch_key = function()
						-- 		return switch("enable_gpt")
						-- 	end,
						-- 	url = "https://models.inference.ai.azure.com/chat/completions",
						-- 	model = "gpt-4o",
						-- 	api_type = "openai",
						-- },
					},

					Translate = {
						handler = tools.qa_handler,
						opts = {
							fetch_key = function()
								return switch("enable_glm")
							end,
							url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
							model = "glm-4-flash",
							api_type = "zhipu",

							component_width = "60%",
							component_height = "50%",
							query = {
								title = " 󰊿 Trans ",
								hl = { link = "Define" },
							},
							input_box_opts = {
								size = "15%",
								win_options = {
									winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
								},
							},
							preview_box_opts = {
								size = "85%",
								win_options = {
									winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
								},
							},
						},
					},

					-- check siliconflow's balance
					UserInfo = {
						handler = function()
							local key = os.getenv("LLM_KEY")
							local res = tools.curl_request_handler(
								"https://api.siliconflow.cn/v1/user/info",
								{ "GET", "-H", string.format("'Authorization: Bearer %s'", key) }
							)
							if res ~= nil then
								print("balance: " .. res.data.balance)
							end
						end,
					},
					WordTranslate = {
						handler = tools.flexi_handler,
						prompt = "Translate the following text to Chinese, please only return the translation",
						-- opts = {
						-- 	fetch_key = function()
						-- 		return switch("enable_glm")
						-- 	end,
						-- 	url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
						-- 	model = "glm-4-flash",
						-- 	api_type = "zhipu",
						-- 	args = [[return {url, "-N", "-X", "POST", "-H", "Content-Type: application/json", "-H", authorization, "-d", vim.fn.json_encode(body)}]],
						-- 	exit_on_move = true,
						-- 	enter_flexible_window = false,
						-- },
					},
					CodeExplain = {
						handler = tools.flexi_handler,
						prompt = "Explain the following code, please only return the explanation, and answer in English",
						-- opts = {
						-- 	fetch_key = function()
						-- 		return switch("enable_glm")
						-- 	end,
						-- 	url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
						-- 	model = "glm-4-flash",
						-- 	api_type = "zhipu",
						-- 	enter_flexible_window = true,
						-- },
					},
					CommitMsg = {
						handler = tools.flexi_handler,
						prompt = function()
							return string.format(
								[[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:
1. Start with an action verb (e.g., feat, fix, refactor, chore, etc.).
2. Include a scope in parentheses if applicable
3. Provide a concise summary of the change
4. Mention specific Most important functions, components, or files affected with max three files

Examples:
- feat(order-details): update common/util.py, added test cases for util.py
- fix(order-details): resolve bug in user/auth.py related to login validation
- refactor(order-details): optimize database queries in models/query.py

Based on this format, generate appropriate commit messages. Respond with message only. DO NOT format the message in Markdown code blocks, DO NOT use backticks:

```diff
%s
```
]],
								vim.fn.system("git diff --no-ext-diff --staged")
							)
						end,
					},
				},
  -- stylua: ignore
        keys = {
          -- The keyboard mapping for the input window.
          ["Input:Cancel"]      = { mode = "n", key = "<C-c>" },
          ["Input:Submit"]      = { mode = "n", key = "<cr>" },
          ["Input:Resend"]      = { mode = "n", key = "<C-r>" },

          -- only works when "save_session = true"
          ["Input:HistoryNext"] = { mode = "n", key = "<C-j>" },
          ["Input:HistoryPrev"] = { mode = "n", key = "<C-k>" },

          -- The keyboard mapping for the output window in "split" style.
          ["Output:Ask"]        = { mode = "n", key = "i" },
          ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
          ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

          -- The keyboard mapping for the output and input windows in "float" style.
          ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
          ["Session:Close"]     = { mode = "n", key = "<esc>" },
        },
			})
		end,
		keys = {
			{ "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = "Chat" },
			{ "<leader>ae", mode = "v", "<cmd>LLMAppHandler CodeExplain<cr>", desc = "Explain Code" },
			{ "<leader>at", mode = "x", "<cmd>LLMAppHandler TestCode<cr>", desc = "Test Code" },
			{ "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimCompare<cr>", desc = "Optimize Compare" },
			-- { "<leader>au", mode = "n", "<cmd>LLMAppHandler UserInfo<cr>", desc = "User Info" },
			{ "<leader>ag", mode = "n", "<cmd>LLMAppHandler CommitMsg<cr>", desc = "Commit Message" },
			-- { "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimizeCode<cr>" },
		},
	},
	{
		"milanglacier/minuet-ai.nvim",
		lazy = false,
		config = require("plugins-options.minuet").config,
	},
}
