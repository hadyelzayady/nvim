local M = {}

function M.config()
	local harpoon = require("harpoon")
	harpoon:setup()
	require("config.keymaps").harpoon()
	harpoon:extend({
		UI_CREATE = function(cx)
			vim.keymap.set("n", "<C-v>", function()
				harpoon.ui:select_menu_item({ vsplit = true })
			end, { buffer = cx.bufnr })

			vim.keymap.set("n", "<C-x>", function()
				harpoon.ui:select_menu_item({ split = true })
			end, { buffer = cx.bufnr })

			vim.keymap.set("n", "<C-t>", function()
				harpoon.ui:select_menu_item({ tabedit = true })
			end, { buffer = cx.bufnr })
		end,
	})
end

return M
