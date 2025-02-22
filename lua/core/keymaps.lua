local map = vim.keymap.set

-- Resize
map("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Navigation
map("n", "<leader>'", function()
	require("fzf-lua").resume()
end, { desc = "FzfLua Resume" })

map("n", "<leader>E", "<cmd>NvimTreeFindFile<CR>", { desc = "NvimTree Find File Toggle" })
map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<C-e>", "<cmd>FzfLua oldfiles previewer=builtin<cr>", { desc = "Recent Files" })
map("n", "<leader>ff", "<cmd>FzfLua files previewer=builtin<cr>", { desc = "Find File" })
map("n", "<leader>fb", "<cmd>FzfLua buffers previewer=builtin<cr>", { desc = "Find Buffer" })
map("n", "<leader>ft", "<cmd>FzfLua filetypes previewer=builtin<cr>", { desc = "File Types" })
map("n", "<leader>sm", "<cmd>FzfLua marks previewer=builtin<cr>", { desc = "Search Marks" })
map("n", "<leader>jl", function()
	require("flash").jump({
		search = { mode = "search", max_length = 0 },
		label = { after = { 0, 0 } },
		pattern = "^",
	})
end, { desc = "Jump To Line" })
map("n", "<leader>xq", function()
	require("quicker").toggle()
end, { desc = "Toggle quickfix" })
map("n", "<leader>xl", function()
	require("quicker").toggle({ loclist = true })
end, { desc = "Toggle loclist" })
map("n", "<leader>cS", "<cmd>AerialToggle<cr>", { silent = true, desc = "Symbole Outline" })
map("n", "<leader>cs", "<cmd>AerialNavToggle<cr>", { silent = true, desc = "Symbole Nav" })

map("n", "<leader>d", function()
	MiniBufremove.delete(0)
end, { desc = "Delete Buffer" })
map("n", "<leader>D", function()
	MiniBufremove.delete(0, true)
end, { desc = "Force Delete Buffer" })

-- quit/session/projects
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>Q", "<cmd>silent! qa!<cr>", { desc = "Force Quit all" })
map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })
-- end quit/session/projects

-- Quickfix
map("n", "<c-,>", function()
	vim.cmd("silent! cnext")
end, { desc = "Next Quickfix Item" })
map("n", "<c-.>", function()
	vim.cmd("silent! cprevious")
end, { desc = "Prev Quickfix Item" })
map("n", "<c-q>", function()
	vim.cmd("cclose")
	-- require("neogit").close()
end, { desc = "Close Common Splits" })

-- Git
map("n", "<leader>gn", "<cmd>Git<CR>", { desc = "Neogit" })
map("n", "<leader>ga", "<cmd>CoAuthor<CR>", { desc = "Co-Author" })

map("n", "<leader>g,g", "<cmd>AdvancedGitSearch search_log_content<cr>", { desc = "Grep in current branch history" })
map(
	"n",
	"<leader>g,G",
	"<cmd>AdvancedGitSearch search_log_content_file<cr>",
	{ desc = "Grep in current branch history for current file" }
)
map("n", "<leader>g,d", "<cmd>AdvancedGitSearch diff_branch_file<cr>", { desc = "Diff File With Branch" })
map("n", "<leader>g,b", function()
	require("agitator").search_git_branch()
end, { desc = "Grep in branch" })
map("n", "<leader>g,f", function()
	require("agitator").open_file_git_branch()
end, { desc = "Open file in branch" })
map("n", "<leader>g,m", function()
	require("agitator").git_time_machine()
end, { desc = "Time machine" })
map("n", "<leader>g,c", "<cmd>GhReviewComments<cr>", { desc = "GitHub Review Comments" })

map("n", "<leader>gb", ":Gitsigns blame_line<cr>", { desc = "Blame Current Line" })
map("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Blame Toggle Show Current Line" })
map("n", "<leader>gp", ":Gitsigns preview_hunk_inline<cr>", { desc = "Preview Hunk Inline" })
map("n", "<leader>gj", ":silent! Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
map("n", "<leader>gk", ":silent! Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
map("n", "]g", ":Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
map("n", "[g", ":Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<cr>", { desc = "Reset Hunk", silent = true })
map("n", "<leader>gR", ":Gitsigns reset_buffer<cr>", { desc = "Reset Buffer" })
map("n", "<leader>gs", ":Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
map("n", "<leader>gS", ":Gitsigns undo_stage_hunk<cr>", { desc = "UnStage Hunk" })
map("n", "<leader>gl", ":Gitsigns setqflist<cr>", { desc = "Quickfix Changes" })

map("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "Diff" })
map("n", "<leader>gD", ":DiffviewOpen -- %<cr>", { desc = "Diff file" })
map("n", "<leader>gc", "<cmd>FzfLua git_branches<CR>", { desc = "Checkout Branch" })
map("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Buffer History" })
map("v", "<leader>gh", ":'<,'>DiffviewFileHistory %<CR>", { desc = "Range Buffer History" })
map("n", "<leader>gg", "<cmd>Lazygit<CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gG", "<cmd>Gitui<CR>", { desc = "Gitui", silent = true })

-- diagnostics
map("n", "gK", function()
	local new_config = not vim.diagnostic.config().virtual_lines
	local virtual_text = not new_config
	if virtual_text then
		virtual_text = require("utils.diagnostics").virtual_text
	end
	vim.diagnostic.config({ virtual_lines = new_config, virtual_text = virtual_text })
end, { desc = "Toggle diagnostic virtual_lines" })

-- Tab management
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
