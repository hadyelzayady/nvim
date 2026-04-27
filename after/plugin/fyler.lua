-- Fyler toggle - close if open, open if closed
local function toggle_fyler()
	local fyler = require("fyler")
	local views = vim.tbl_get(fyler, "get_config", "views") or {}
	local finder = views.finder

	-- Check if any Fyler window is open
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local ft = vim.bo[buf].filetype
		if ft == "fyler" then
			vim.api.nvim_win_close(win, false)
			return
		end
	end

	-- If no window open, open fyler
	fyler.open()
end

require("fyler").setup({
	views = {
		finder = {
			close_on_select = false,
			default_explorer = true,
			delete_to_trash = true,

			columns_order = { "link", "git", "diagnostic" },
			win = {
				kind = "split_left_most",
				kinds = {
					split_left_most = {
						width = "13%",
					},
				},
				win_opts = {
					-- concealcursor = "nvic",
					-- conceallevel = 3,
					cursorline = true,
					-- number = false,
					-- relativenumber = false,
					-- winhighlight = "Normal:FylerNormal,NormalNC:FylerNormalNC",
					-- wrap = false,
					-- signcolumn = "no",
				},
			},
		},
	},
})

vim.api.nvim_create_user_command("FylerToggle", toggle_fyler, {})
