local map = vim.keymap.set

map("n", "<leader>gg", "<cmd>Lazygit<CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gG", "<cmd>Git<CR>", { desc = "Git", silent = true })

map("n", "[c", "<cmd>Gitsigns prev_hunk <CR>", { desc = "Prev Hunk", silent = true })

map("n", "]c", "<cmd>Gitsigns next_hunk <CR>", { desc = "Next Hunk", silent = true })

map("n", "<leader>ga", "<cmd>GitAuthors<CR>", { desc = "Co-Author" })
map("n", "<leader>g,g", "<cmd>FzfLua git_commits<cr>", { desc = "Branch Commits" })
map("n", "<leader>g,G", "<cmd>FzfLua git_bcommits<cr>", { desc = "Buffer Commits (in current branch)" })
map("n", "<leader>g,d", "<cmd>AdvancedGitSearch diff_branch_file<cr>", { desc = "Diff File With Branch" })
-- stylua: ignore
map("n", "<leader>g,b", function() require("agitator").search_git_branch() end, { desc = "Grep in branch" })
-- stylua: ignore
map("n", "<leader>g,f", function() require("agitator").open_file_git_branch() end, { desc = "Open file in branch" })
-- stylua: ignore
map("n", "<leader>g,m", function() require("agitator").git_time_machine() end, { desc = "Time machine" })
map("n", "<leader>gk", ":Git! push<cr>", { desc = "Push" })
map("n", "<leader>gj", ":Git! pull<cr>", { desc = "Pull" })
map("n", "<leader>gb", ":Gitsigns blame_line<cr>", { desc = "Blame Current Line" })
map("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Blame Toggle Show Current Line" })
map("n", "<leader>gp", ":Gitsigns preview_hunk_inline<cr>", { desc = "Preview Hunk Inline" })
map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<cr>", { desc = "Reset Hunk", silent = true })
map("n", "<leader>gR", ":Gitsigns reset_buffer<cr>", { desc = "Reset Buffer" })
map("n", "<leader>gs", ":Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
map("n", "<leader>gS", ":Gitsigns undo_stage_hunk<cr>", { desc = "UnStage Hunk" })
map("n", "<leader>gl", ":Gitsigns setqflist<cr>", { desc = "Quickfix Changes" })
--
map("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "Diff" })
map("n", "<leader>gD", ":DiffviewOpen -- %<cr>", { desc = "Diff file" })
map("n", "<leader>gc", "<cmd>FzfLua git_branches<CR>", { desc = "Checkout Branch" })
map("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Buffer History" })
map("v", "<leader>gh", ":'<,'>DiffviewFileHistory %<CR>", { desc = "Range Buffer History" })
