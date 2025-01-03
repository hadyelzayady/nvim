local map = vim.keymap.set

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Copy to clipboard
map("v", "<leader>y", '"+y', { noremap = true, silent = true }) -- Visual mode copy
map("n", "<leader>Y", '"+yg_', { noremap = true, silent = true }) -- Copy to clipboard without moving cursor
map("n", "<leader>y", '"+y', { noremap = true, silent = true }) -- Normal mode copy
map("n", "<leader>yy", '"+yy', { noremap = true, silent = true }) -- Yank the whole line

-- Paste from clipboard
map("n", "<leader>p", '"+p', { noremap = true, silent = true }) -- Normal mode paste
map("n", "<leader>P", '"+P', { noremap = true, silent = true }) -- Paste before cursor
map("v", "<leader>p", '"+p', { noremap = true, silent = true }) -- Visual mode paste
map("v", "<leader>P", '"+P', { noremap = true, silent = true }) -- Visual mode paste before selection

-- Quickfix
map("n", "<c-,>", function() vim.cmd("silent! cnext") end, { desc = "Next Quickfix Item" })
map("n", "<c-.>", function() vim.cmd("silent! cprevious") end, { desc = "Prev Quickfix Item" })
map("n", "<c-q>", function() vim.cmd("cclose") require("neogit").close() end, { desc = "Close Common Splits" })

-- Navigation
map("n", "<leader>w", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, { desc = "Toggle MiniFiles" })
map("n", "<C-e>", "<cmd>FzfLua oldfiles previewer=builtin<cr>", { desc = "Recent Files" })
map("n", "<leader>ff", "<cmd>FzfLua files previewer=builtin<cr>", { desc = "Find File" })
map("n", "<leader>fb", "<cmd>FzfLua buffers previewer=builtin<cr>", { desc = "Find Buffer" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>ft", "<cmd>FzfLua filetypes previewer=builtin<cr>", { desc = "File Types" })
map("n", "<leader>sm", "<cmd>FzfLua marks previewer=builtin<cr>", { desc = "Search Marks" })
map("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil" })
map("n", "<leader>jl", function() require("flash").jump({ search = { mode = "search", max_length = 0 },
		label = { after = { 0, 0 } },
		pattern = "^",
	})
end, { desc = "Jump To Line" })

-- Tab management
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Git
map("n", "<leader>gn", "<cmd>Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>g,g", function() require("agitator").search_git_branch() end, { desc = "Grep in branch" })
map("n", "<leader>g,f", function() require("agitator").open_file_git_branch() end, { desc = "Open file in branch" })
map("n", "<leader>g,m", function() require("agitator").git_time_machine() end, { desc = "Time machine" })
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
-- End Git


-- quit/session/projects
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>Q", "<cmd>silent! qa!<cr>", { desc = "Force Quit all" })
map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })
-- end quit/session/projects

-- search
map("n", "<leader>sw", "<cmd>FzfLua grep_cword previewer=builtin<cr>", { desc = "Search Current Word (project)" })
map("n", "<leader>sb", "<cmd>FzfLua grep_curbuf previewer=builtin<cr>", { desc = "Search Buffer" })
map("n", "<leader>sp", "<cmd>FzfLua grep_project previewer=builtin<cr>", { desc = "Search Project" })
map( { "n", "v" }, "<leader>sv", "<cmd>FzfLua grep_visual previewer=builtin<cr>", { desc = "Search Visual", noremap = true }
)
map("n", "<leader>sg", "<cmd>FzfLua live_grep_glob previewer=builtin<cr>", { desc = "Grep" })
