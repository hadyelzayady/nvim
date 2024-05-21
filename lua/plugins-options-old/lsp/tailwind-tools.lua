local M = {}

function M.config()
	require("tailwind-tools").setup(
		---@type TailwindTools.Option
		{
			document_color = {
				enabled = true, -- can be toggled by commands
				kind = "inline", -- "inline" | "foreground" | "background"
				inline_symbol = "󰝤 ", -- only used in inline mode
				debounce = 200, -- in milliseconds, only applied in insert mode
			},
			conceal = {
				enabled = true, -- can be toggled by commands
				symbol = "󱏿", -- only a single character is allowed
				highlight = { -- extmark highlight options, see :h 'highlight'
					fg = "#38BDF8",
				},
			},
			custom_filetypes = {}, -- see the extension section to learn how it works
		}
	)

	vim.keymap.set("n", "<leader>ntc", "<cmd>TailwindConcealToggle<cr>", { desc = "Toggle tailwind-tools" })
end

return M