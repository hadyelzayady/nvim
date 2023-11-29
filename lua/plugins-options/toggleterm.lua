local M = {}

function M.config()
	require("toggleterm").setup({})

	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		dir = "git_dir",
		direction = "float",
		float_opts = {
			-- border = "double",
		},
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		-- function to run on closing the terminal
		on_close = function(term)
			vim.cmd("startinsert!")
		end,
	})
	local gitui = Terminal:new({
		cmd = "gitui",
		dir = "git_dir",
		direction = "float",
		float_opts = {
			-- border = "double",
		},
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		-- function to run on closing the terminal
		on_close = function(term)
			vim.cmd("startinsert!")
		end,
	})
	vim.api.nvim_create_user_command("Lazygit", function(args)
		lazygit:toggle()
	end, {})
	vim.api.nvim_create_user_command("Gitui", function(args)
		gitui:toggle()
	end, {})
end

return M