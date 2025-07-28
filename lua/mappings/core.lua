local map = vim.keymap.set

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>Q", "<cmd>silent! qa!<cr>", { desc = "Force Quit all" })
map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New File" })

--=================  Resize ==========================
map("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

--=================== Clipbaord =======================
-- to not copy to clipboard when paste
map("v", "p", '"_dP', { noremap = true, silent = true })
map("v", "P", '"_dP', { noremap = true, silent = true })

--=================  Tab Management ===================
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

--=================  Toggle ===================
map("n", "<leader>tf", "<cmd>set foldenable!<cr>", { noremap = true, silent = true, desc = "Toggle Fold" }) -- Visual mode paste before selection

--=================== Close =======================
map("n", "<c-q>", function()
	vim.cmd("cclose")
	vim.cmd("CloseFugitive")
	-- require("neogit").close()
end, { desc = "Close Common Splits" })

-- =================== UndoTree =======================
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = true, desc = "Toggle UndoTree" })
