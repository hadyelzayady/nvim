return {
	{
		"nvimtools/hydra.nvim",
		config = require("plugins-options.hydra").config,
		branch = "main",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
		},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			vim.keymap.set("n", "<leader>ups", function()
				vim.cmd([[
		:profile start /tmp/nvim-profile.log
		:profile func *
		:profile file *
	]])
			end, { desc = "Profile Start" })

			vim.keymap.set("n", "<leader>upe", function()
				vim.cmd([[
		:profile stop
		:e /tmp/nvim-profile.log
	]])
			end, { desc = "Profile End" })
			wk.register({ p = { name = "Perf Profiling" } }, { prefix = "<leader>u" })
			wk.register({
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader>t"] = { name = "+toggle" },
				["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>r"] = { name = "+run/debug" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>g"] = { name = "+git" },
				["<leader>q"] = { name = "+quit/session" },
				["<leader>s"] = { name = "+search" },
				["<leader>w"] = { name = "+windows" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
				["<leader>l"] = { name = "+lsp" },
				["<leader>m"] = { name = "+Misc" },
				-- ["<leader>C"] = {
				-- 	name = "ChatGPT",
				-- 	c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
				-- 	C = { "<cmd>ChatGPTCompleteCode<CR>", "Complete Code", noremap = true },
				-- 	e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
				-- 	g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
				-- 	t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
				-- 	k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
				-- 	d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
				-- 	a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
				-- 	o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
				-- 	s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
				-- 	f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
				-- 	x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
				-- 	r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
				-- 	l = {
				-- 		"<cmd>ChatGPTRun code_readability_analysis<CR>",
				-- 		"Code Readability Analysis",
				-- 		mode = { "n", "v" },
				-- 	},
				-- },
			})
		end,
	},
}
