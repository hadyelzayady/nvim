local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local nmap = function(lhs, rhs, desc)
	-- See `:h vim.keymap.set()`
	vim.keymap.set("n", lhs, rhs, { desc = desc, silent = true })
end
local nmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc, noremap = true, silent = true })
end
local vmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("v", "<Leader>" .. suffix, rhs, { desc = desc, noremap = true, silent = true })
end
local nvmap_leader = function(suffix, rhs, desc)
	vim.keymap.set({ "v", "n" }, "<Leader>" .. suffix, rhs, { desc = desc, noremap = true, silent = true })
end
local xmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc })
end

--=============== Leader Keys ===============
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--======================== find/search =================================
nmap_leader("ff", ":FzfLua files<CR>", "Files")
nmap_leader("fw", ":FzfLua grep_cword<CR>", "Grep CWord")
nmap_leader("fs", ":FzfLua live_grep<CR>", "Live Grep")
vmap_leader("fs", "<cmd>FzfLua grep_visual<CR>", "Grep Visual")
nmap("ff", "<cmd>lua require('fff').find_files()<CR>", "fff")

--=============== File Tree ===============
map("n", "<leader>e", ":FylerToggle<CR>", opts)

--================== Window/Buffers ====================
nmap("<c-w>C", ":tabclose<cr>", "Close Tab")

--======================= Save/Write ===========================
nmap_leader("w", ":write<CR>", "Save")
nmap_leader("x", ":xit<CR>", "Quit")
nmap_leader("qq", "<cmd>q<cr>", "Quit")
nmap_leader("qQ", "<cmd>qa<cr>", "Quit All")
nmap_leader("Q", "<cmd>silent! qa!<cr>", "Force Quit all")

--=================== Close =======================
map("n", "<c-q>", function()
	vim.cmd("cclose")
	vim.cmd("CloseFugitive")
	-- require("neogit").close()
end, { desc = "Close Common Splits" })

-- ============================= GIT ==========================
nmap_leader("gp", ":lua MiniDiff.toggle_overlay()<cr>", "Toggle Diff Overlay")
nmap_leader("gd", ":DiffviewOpen<cr>", "Diff")
nmap_leader("gD", ":DiffviewOpen -- %<cr>", "Diff file")
nmap_leader("gh", ":DiffviewFileHistory %<CR>", "Buffer History")
nmap_leader("gh", ":'<,'>DiffviewFileHistory %<CR>", "Range Buffer History")
nmap_leader("gg", ":Lazygit<cr>", "LazyGit")
nmap_leader("gR", ":Gread<cr>", "Reset Buffer")
nmap_leader("gw", ":FzfLua git_worktrees<cr>", "Pick Work Tree")
nmap_leader("gr", ":lua MiniDiff.do_hunks(nil,'reset')<cr>", "Reset Hunk")

nmap_leader("u", ":Atone toggle<cr>", "UndoTree")
-- ================================================LSP ==============================================

-- ====================  Code Navigation ================
nmap("gd", vim.lsp.buf.definition, "Go to Definition")
nmap("gD", vim.lsp.buf.declaration, "Go to Declaration")
nmap("gru", function()
	vim.lsp.buf.references({ includeDeclaration = false })
end, "Go to References")
nvmap_leader("lf", "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>", "Format")

nmap_leader("cS", "<cmd>AerialToggle<cr>", "Symbole Outline")
nmap_leader("cs", "<cmd>AerialNavToggle<cr>", "Symbole Nav")
