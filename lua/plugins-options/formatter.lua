return function()
	local util = require("formatter.util")
	return {
		-- Enable or disable logging
		logging = true,
		-- Set the log level
		log_level = vim.log.levels.WARN,
		-- All formatter configurations are opt-in
		filetype = {
			-- Formatter configurations for filetype "lua" go here
			-- and will be executed in order
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			typescriptreact = {
				require("formatter.filetypes.typescriptreact").prettierd,
				require("formatter.filetypes.typescriptreact").eslint_d,
			},
			javascriptreact = {
				require("formatter.filetypes.typescriptreact").prettierd,
				require("formatter.filetypes.typescriptreact").eslint_d,
			},
			javascript = {
				require("formatter.filetypes.typescriptreact").prettierd,
				require("formatter.filetypes.typescriptreact").eslint_d,
			},
			typescript = {
				require("formatter.filetypes.typescriptreact").prettierd,
				require("formatter.filetypes.typescriptreact").eslint_d,
			},
			scss = {
				require("formatter.filetypes.typescriptreact").prettierd,
			},

			sh = {
				require("formatter.filetypes.sh").shfmt,
			},
			python = {
				require("formatter.filetypes.python").black,
			},

			json = {
				require("formatter.filetypes.json").prettierd,
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	}
end
