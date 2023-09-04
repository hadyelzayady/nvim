local M = {}

function M.opts()
	local builtin = require("veil.builtin")

	return {
		sections = {
			builtin.sections.animated(builtin.headers.frames_nvim, {
				hl = { fg = "#5de4c7" },
			}),
			builtin.sections.buttons({
				{
					icon = "",
					text = "Find Files",
					shortcut = "f",
					callback = function()
						require("fzf-lua").files()
					end,
				},
				{
					icon = "",
					text = "Find Word",
					shortcut = "w",
					callback = function()
						require("fzf-lua").live_grep()
					end,
				},
				{
					icon = "",
					text = "Buffers",
					shortcut = "b",
					callback = function()
						require("fzf-lua").buffers()
					end,
				},
				{
					icon = "",
					text = "Config",
					shortcut = "c",
					callback = function()
						require("fzf-lua").files({ cwd = "~/.config/nvim" })
					end,
				},
			}),
			builtin.sections.oldfiles(),
		},
		mappings = {
			f = "<cmd>lua require('fzf-lua').files()<cr>",
		},
		startup = true,
		listed = false,
	}
end

return M
