local map = vim.keymap.set

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

--=================  Resize ==========================
map("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

--=================  Close ============================
map("n", "<c-q>", function()
	vim.cmd("cclose")
	vim.cmd("CloseFugitive")
	-- require("neogit").close()
end, { desc = "Close Common Splits" })

--=================  Navigation =======================
map("n", "<leader>'", function()
	require("fzf-lua").resume()
end, { desc = "FzfLua Resume" })
map("n", "<leader>E", "<cmd>NvimTreeFindFile<CR>", { desc = "NvimTree Find File Toggle" })
map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<C-e>", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find File" })
map("n", "<leader>fb", "<cmd>FzfLua buffers previewer=builtin<cr>", { desc = "Find Buffer" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>ft", "<cmd>FzfLua filetypes previewer=builtin<cr>", { desc = "File Types" })
map("n", "<leader>sm", "<cmd>FzfLua marks previewer=builtin<cr>", { desc = "Search Marks" })
map("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil" })
map("n", "<leader>jl", function()
	require("flash").jump({
		search = { mode = "search", max_length = 0 },
		label = { after = { 0, 0 } },
		pattern = "^",
	})
end, { desc = "Jump To Line" })

map("n", "<leader>cS", "<cmd>AerialToggle<cr>", { silent = true, desc = "Symbole Outline" })
map("n", "<leader>cs", "<cmd>AerialNavToggle<cr>", { silent = true, desc = "Symbole Nav" })
-- stylua: ignore
map("n", "<leader>d", function() MiniBufremove.delete(0) end, { desc = "Delete Buffer" })
-- stylua: ignore
map("n", "<leader>D", function() MiniBufremove.delete(0, true) end, { desc = "Force Delete Buffer" })

--=================  Tab Management ===================
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

--=================  Git ==============================
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
map("n", "]c", ":silent! Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
map("n", "[c", ":silent! Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
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
map("n", "<leader>gg", "<cmd>Lazygit<CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gG", "<cmd>Git<CR>", { desc = "Fugitive", silent = true })

map("n", "<leader>h", ":UndotreeToggle <CR>", { desc = "File Local History" })

--=================  Toggle ===================
map("n", "<leader>tf", "<cmd>set foldenable!<cr>", { noremap = true, silent = true, desc = "Toggle Fold" }) -- Visual mode paste before selection
-- stylua: ignore
map( "n", "<leader>tdw", require("utils.diff").toggle_diffopt("iwhite"), { noremap = true, silent = true, desc = "White Space" }) -- Visual mode paste before selection
-- stylua: ignore
map( "n", "<leader>tdb", require("utils.diff").toggle_diffopt("iblank"), { noremap = true, silent = true, desc = "Blank Lines" }) -- Visual mode paste before selection
-- stylua: ignore
map("n", "<leader>tdc", require("utils.diff").toggle_diffopt("icase"), { noremap = true, silent = true, desc = "Case" }) -- Visual mode paste before selection
-- stylua: ignore
map( "n", "<leader>tdi", require("utils.diff").toggle_diffopt("internal"), { noremap = true, silent = true, desc = "Internal" }) -- Visual mode paste before selection
-- stylua: ignore
map( "n", "<leader>ltd", require("utils.diff").toggle_diffopt("iwhite"), { noremap = true, silent = true, desc = "Toggle Fold" }) -- Visual mode paste before selection

--=================  Quit/Session ===================
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>Q", "<cmd>silent! qa!<cr>", { desc = "Force Quit all" })
map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })

--=================  Search ===================
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Search Current Word (project)" })
map("n", "<leader>sb", function()
	require("fzf-lua").grep_curbuf({ previewer = "builtin", winopts = { preview = { hidden = false } } })
end, { desc = "Search Buffer" })
map("n", "<leader>sp", "<cmd>FzfLua grep_project<cr>", { desc = "Search Project" })
map({ "n", "v" }, "<leader>sv", "<cmd>FzfLua grep_visual<cr>", { desc = "Search Visual", noremap = true })
map("n", "<leader>sg", "<cmd>FzfLua live_grep_glob<cr>", { desc = "Grep" })

--=================  Lsp ===================
-- stylua: ignore
map("n", "[w", function() vim.diagnostic.jump({ count = -vim.v.count1, severity = "WARN" }) end, { silent = true, desc = "Prev Warning" })
-- stylua: ignore
map("n", "]w", function() vim.diagnostic.jump({ count = vim.v.count1, severity = "WARN" }) end, { silent = true, desc = "Next Warning" })
-- stylua: ignore
map("n", "[e", function() vim.diagnostic.jump({ count = -vim.v.count1, severity = "ERROR" }) end, { silent = true, desc = "Prev Error" })
-- stylua: ignore
map("n", "]e", function() vim.diagnostic.jump({ count = vim.v.count1, severity = "ERROR" }) end, { silent = true, desc = "Next Error" })
-- map(
--     "n",
--     "<leader>xd",
--     require("utils.lsp-operations").quickfix_document_diagnostics,
--     { silent = true, desc = "Document Diagnostics" }
-- )
-- map(
--     "n",
--     "<leader>xD",
--     require("utils.lsp-operations").quickfix_project_diagnostics,
--     { silent = true, desc = "Project Diagnostics" }
-- )
-- map(
--     "n",
--     "<leader>ld",
--     "<cmd>FzfLua lsp_document_diagnostics <cr>",
--     { silent = true, desc = "Document Diagnostics(Fzf)" }
-- )
-- map(
--     "n",
--     "<leader>lD",
--     "<cmd>FzfLua lsp_workspace_diagnostics <cr>",
--     { silent = true, desc = "Project Diagnostics(Fzf)" }
-- )
--
-- stylua: ignore
map("n", "<leader>ldv", function() require("utils.diagnostics").toggle_virtual_lines() end, { desc = "Toggle diagnostic virtual_lines" })
-- stylua: ignore
map("n", "<leader>ldc", function() require("utils.diagnostics").toggle_current_line() end, { desc = "Toggle Current Line Diagnostics" })
-- stylua: ignore
map("n", "<leader>ldt", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { desc = "Toggle Diagnostics" })
--
map({ "n", "v" }, "<leader>lf", require("utils.lsp-operations").format, { silent = true, desc = "Format" })
map("n", "gd", require("utils.lsp-operations").goto_definition, { desc = "Goto Definition" })
-- map("n", "gvd", function()
--     vim.cmd("vsplit")
--     require("utils.lsp-operations").goto_definition()
-- end, { desc = "Goto Definition" })
map("n", "gD", require("utils.lsp-operations").goto_declaration, { desc = "Goto Declaration" })
-- map("n", "grr", require("utils.lsp-operations").goto_references, { desc = "Goto References" })
map("n", "gR", require("utils.lsp-operations").goto_file_references, { desc = "Goto File References" })
map("n", "gt", require("utils.lsp-operations").goto_type_definition, { desc = "Goto Type Definition" })
-- map("n", "gI", require("utils.lsp-operations").goto_implementations, { desc = "Goto Implementations" })
map("n", "<leader>li", require("utils.lsp-operations").goto_incoming_calls, { desc = "Goto Incoming Calls" })
map("n", "<leader>lo", require("utils.lsp-operations").goto_outgoing_calls, { desc = "Goto Outgoing Calls" })
map("n", "<leader>ls", "<cmd>FzfLua lsp_live_workspace_symbols previewer=builtin<cr>", { desc = "Workspace Symbols" })
map("n", "<leader>lS", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Document Symbols" })
-- map("n", "<leader>lr", require("utils.lsp-operations").rename, { silent = true, desc = "Rename" })
-- map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { silent = true, desc = "Code Actions" })
-- map("n", "<leader>lR", require("utils.lsp-operations").rename_file, { desc = "Rename File" })
map("n", "<leader>cf", require("utils.lsp-operations").fixAll, { desc = "Fix All" })
map("n", "<leader>cc", require("utils.lsp-operations").removeUnused, { desc = "Remove Unused" })
map("n", "<leader>cC", require("utils.lsp-operations").removeUnusedImports, { desc = "Remove Unused Imports" })
map("n", "<leader>ci", require("utils.lsp-operations").addMissingImports, { desc = "Add Missing Imports" })
map("n", "<leader>ltd", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle Diagnostics", silent = true })

--=================  Logs ===================
map("n", "<leader>,v", ":lua require('chainsaw').variableLog()<cr>", { silent = true, desc = "Variable" })
map("n", "<leader>,l", ":lua require('chainsaw').messageLog()<cr>", { silent = true, desc = "Message" })
map("n", "<leader>,o", ":lua require('chainsaw').objectLog()<cr>", { silent = true, desc = "Object" })
map("n", "<leader>,t", ":lua require('chainsaw').timeLog()<cr>", { silent = true, desc = "Time" })
map("n", "<leader>,x", ":lua require('chainsaw').removeLogs()<cr>", { silent = true, desc = "Clear" })
