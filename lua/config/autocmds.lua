local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd
-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("hilight_on_yank"),
	callback = function()
		vim.highlight.on_yank({ timeout = 40 })
	end,
})

autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
-- 5. Update neotree when closin the git client.
autocmd("TermClose", {
	pattern = { "*lazygit", "*gitui" },
	desc = "Refresh Neo-Tree git when closing lazygit/gitui",
	callback = function()
		local manager_avail, manager = pcall(require, "neo-tree.sources.manager")
		if manager_avail then
			for _, source in ipairs({
				"filesystem",
				"git_status",
				"document_symbols",
			}) do
				local module = "neo-tree.sources." .. source
				if package.loaded[module] then
					manager.refresh(require(module).name)
				end
			end
		end
	end,
})

autocmd("BufWritePost", {
	group = augroup("sxhkd"),
	pattern = { "*sxhkdrc" },
	callback = function()
		vim.cmd("silent! !pkill -USR1 sxhkd")
	end,
})

autocmd("BufWritePost", {
	group = augroup("bar"),
	pattern = { "bar.sh" },
	callback = function()
		vim.cmd("silent! !pkill bar || bar & disown")
	end,
})
autocmd("BufReadPre", {
	group = augroup("specific_files_keys"),
	pattern = { "Cargo.toml", "package.json" },
	callback = function(opt)
    local packages_files_operations= require("utils.packages_files_operations");
		require("config.keymaps").packages_file_keymaps(
		 packages_files_operations[packages_files_operations.filename_to_key[opt.file]]
		)
	end,
})
