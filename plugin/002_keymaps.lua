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
nmap_leader("f'", ":FzfLua resume<CR>", "Resume")
nmap_leader("fs", ":FzfLua live_grep<CR>", "Live Grep")
vmap_leader("fs", "<cmd>FzfLua grep_visual<CR>", "Grep Visual")
nmap("ff", "<cmd>lua require('fff').find_files()<CR>", "fff")

--=============== File Tree ===============
nmap_leader("e", ":FylerToggle<CR>", "Toggle File Tree")
nmap_leader("d", ":lua MiniBufremove.delete(0)<cr>", "Delete Buffer")
nmap_leader("D", ":lua MiniBufremove.delete(0, true)<cr>", "Force Delete Buffer")
nmap("<C-l>", ":lua require('scribble').toggle()<cr>", "Toggle Scribble")

--================== Window/Buffers ====================
nmap("<c-w>C", ":tabclose<cr>", "Close Tab")
nmap("<c-w>t", ":tabnew<cr>", "Tab New")

--======================= Save/Write ===========================
nmap_leader("x", ":xit<CR>", "Quit")
nmap_leader("qq", "<cmd>q<cr>", "Quit")
nmap_leader("qQ", "<cmd>qa<cr>", "Quit All")
nmap_leader("Q", "<cmd>silent! qa!<cr>", "Force Quit all")
nmap_leader("qw", "<cmd>silent! wall<cr>", "Save All")
nmap_leader("qW", "<cmd>silent! w<cr>", "Save Current")
nmap_leader("n", "<cmd>enew<cr>", "New File")

--=================== Close =======================
map("n", "<c-q>", function()
	vim.cmd("cclose")
	vim.cmd("CloseFugitive")
	-- require("neogit").close()
end, { desc = "Close Common Splits" })

-- ============================= GIT ==========================
nmap_leader("gd", ":DiffviewOpen<cr>", "Diff")
nmap_leader("gD", ":DiffviewOpen -- %<cr>", "Diff file")
nmap_leader("gh", "<cmd>DiffviewFileHistory %<CR>", "Buffer History")
vmap_leader("gh", ":'<,'>DiffviewFileHistory %<CR>", "Range Buffer History")
nmap_leader("gg", ":Lazygit<cr>", "LazyGit")
nmap_leader("gR", ":Gread<cr>", "Reset Buffer")
nmap_leader("gw", ":FzfLua git_worktrees<cr>", "Pick Work Tree")

nmap("[c", "<cmd>Gitsigns prev_hunk <CR>", "Prev Hunk")
nmap("]c", "<cmd>Gitsigns next_hunk <CR>", "Next Hunk")
nmap_leader("gb", ":Gitsigns blame_line<cr>", "Blame Current Line")
nmap_leader("gB", ":Gitsigns toggle_current_line_blame<cr>", "Blame Toggle Show Current Line")
nmap_leader("gp", ":Gitsigns preview_hunk_inline<cr>", "Preview Hunk Inline")
nmap_leader("gP", ":Gitsigns preview_hunk<cr>", "Preview Hunk")
nvmap_leader("gr", ":Gitsigns reset_hunk<cr>", "Reset Hunk")
nmap_leader("gR", ":Gitsigns reset_buffer<cr>", "Reset Buffer")
nmap_leader("gs", ":Gitsigns stage_hunk<cr>", "Stage Hunk")
nmap_leader("gS", ":Gitsigns undo_stage_hunk<cr>", "UnStage Hunk")
nmap_leader("gl", ":Gitsigns setqflist<cr>", "Quickfix Changes")

nmap_leader("u", ":Atone toggle<cr>", "UndoTree")

-- ================================================LSP ==============================================

nmap("gd", vim.lsp.buf.definition, "Go to Definition")
nmap("gD", vim.lsp.buf.declaration, "Go to Declaration")
nmap("gru", function()
	vim.lsp.buf.references({ includeDeclaration = false })
end, "Go to References")
nvmap_leader("lf", "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>", "Format")

nmap_leader("cS", "<cmd>AerialToggle<cr>", "Symbole Outline")
nmap_leader("cs", "<cmd>AerialNavToggle<cr>", "Symbole Nav")
nmap("[w", ":lua vim.diagnostic.jump({ count = -vim.v.count1, severity = 'WARN' })<cr>", "Prev Warning")
nmap("]w", ":lua vim.diagnostic.jump({ count = vim.v.count1, severity = 'WARN' })<cr>", "Next Warning")
nmap("[e", ":lua vim.diagnostic.jump({ count = -vim.v.count1, severity = 'ERROR' })<cr>", "Prev Error")
nmap("]e", ":lua vim.diagnostic.jump({ count = vim.v.count1, severity = 'ERROR' })<cr>", "Next Error")

-- ==================== Debug/Log ==========================
nmap_leader(",v", ":lua require('chainsaw').variableLog()<cr>", "Variable")
nmap_leader(",l", ":lua require('chainsaw').messageLog()<cr>", "Message")
nmap_leader(",o", ":lua require('chainsaw').objectLog()<cr>", "Object")
nmap_leader(",t", ":lua require('chainsaw').timeLog()<cr>", "Time")
nmap_leader(",x", ":lua require('chainsaw').removeLogs()<cr>", "Clear")
