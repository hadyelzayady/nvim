local M = {}
local map = vim.keymap.set

function M.setup()
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

	-- toggle

	map("n", "<leader>tf", "<cmd>set foldenable!<cr>", { noremap = true, silent = true, desc = "Toggle Fold" }) -- Visual mode paste before selection

	-- navigation
	map("n", "<leader>E", "<cmd>NvimTreeFindFile<CR>", { desc = "NvimTree Find File Toggle" })
	map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree" })
	map("n", "<leader>w", function()
		MiniFiles.open(vim.api.nvim_buf_get_name(0))
	end, { desc = "Toggle NvimTree" })
	map("n", "<c-,>", function()
		-- require("trouble").next()
		vim.cmd("silent! cnext")
	end, { desc = "Next Quickfix Item" })
	map("n", "<c-.>", function()
		vim.cmd("silent! cprevious")
		-- require("trouble").prev()
	end, { desc = "Prev Quickfix Item" })
	map("n", "<c-q>", function()
		vim.cmd("cclose")
		require("neogit").close()
		-- require("trouble").close()
	end, { desc = "Close Common Splits" })

	-- resize
	map("n", "<m-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
	map("n", "<m-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
	map("n", "<m-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
	map("n", "<m-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
	map("n", "<C-e>", "<cmd>FzfLua oldfiles previewer=builtin<cr>", { desc = "Recent Files" })
	map("n", "<leader>ff", "<cmd>FzfLua files previewer=builtin<cr>", { desc = "Find File" })
	map("n", "<leader>fb", "<cmd>FzfLua buffers previewer=builtin<cr>", { desc = "Find Buffer" })
	map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
	map("n", "<leader>ft", "<cmd>FzfLua filetypes previewer=builtin<cr>", { desc = "File Types" })
	map("n", "<leader>sm", "<cmd>FzfLua marks previewer=builtin<cr>", { desc = "Search Marks" })
	map("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil" })

	map("n", "<leader>cS", "<cmd>AerialToggle<cr>", { silent = true, desc = "Symbole Outline" })
	map("n", "<leader>cs", "<cmd>AerialNavToggle<cr>", { silent = true, desc = "Symbole Nav" })

	-- search
	map("n", "<leader>sw", "<cmd>FzfLua grep_cword previewer=builtin<cr>", { desc = "Search Current Word (project)" })
	map("n", "<leader>sb", "<cmd>FzfLua grep_curbuf previewer=builtin<cr>", { desc = "Search Buffer" })
	map("n", "<leader>sp", "<cmd>FzfLua grep_project previewer=builtin<cr>", { desc = "Search Project" })
	map(
		{ "n", "v" },
		"<leader>sv",
		"<cmd>FzfLua grep_visual previewer=builtin<cr>",
		{ desc = "Search Visual", noremap = true }
	)
	map("n", "<leader>sg", "<cmd>FzfLua live_grep_glob previewer=builtin<cr>", { desc = "Grep" })
	-- end search

	-- Tab management
	map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
	map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
	map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
	map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
	-- end tab management

	map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
	-- jumping around
	map("n", "<leader>jl", function()
		require("flash").jump({
			search = { mode = "search", max_length = 0 },
			label = { after = { 0, 0 } },
			pattern = "^",
		})
	end, { desc = "Jump To Line" })
	-- end jumping around

	-- Git
	map("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "Diff" })
	map("n", "<leader>gD", ":DiffviewOpen -- %<cr>", { desc = "Diff file" })
	map("n", "<leader>gc", "<cmd>FzfLua git_branches<CR>", { desc = "Checkout Branch" })
	map("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Buffer History" })
	map("v", "<leader>gh", ":'<,'>DiffviewFileHistory %<CR>", { desc = "Range Buffer History" })
	map("n", "<leader>gn", "<cmd>Neogit<CR>", { desc = "Neogit" })
	map("n", "<leader>gg", "<cmd>Lazygit<CR>", { desc = "Lazygit", silent = true })
	map("n", "<leader>gG", "<cmd>Gitui<CR>", { desc = "Gitui", silent = true })
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
	-- End Git

	-- quit/session/projects
	map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
	map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
	map("n", "<leader>Q", "<cmd>silent! qa!<cr>", { desc = "Force Quit all" })
	map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
	map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })
	-- end quit/session/projects

	-- Phelix TODO
	map("n", "<leader>ot", function()
		local todoFile = vim.fn.expand("$HOME/Documents/projects/todo.md")
		vim.cmd("e " .. todoFile)
	end, { silent = true, desc = "Open Todo" })

	-- format
end

function M.neotest()
	map("n", "<leader>rtt", function()
		require("neotest").run.run()
	end, { desc = "Run Nearest Test" })
	map("n", "<leader>rtf", function()
		require("neotest").run.run(vim.fn.expand("%"))
	end, { desc = "Run Test File" })
	map("n", "<leader>rtd", function()
		require("neotest").run.run({ strategy = "dap" })
	end, { desc = "Debug Test File" })
	map("n", "<leader>rts", function()
		require("neotest").run.stop()
	end, { desc = "Stop Nearest Test" })
	map("n", "<leader>rta", function()
		require("neotest").run.attach()
	end, { desc = "Attach Nearest Test" })
	map("n", "<leader>rto", "<cmd>Neotest output-panel<cr>", { desc = "Show Output Panel" })
	map("n", "<leader>rtO", "<cmd>Neotest output<cr>", { desc = "Show Output" })
end

function M.lsp()
	local opts = { silent = true }

	map("n", "[w", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	end, opts)
	map("n", "]w", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	end, opts)
	map("n", "[e", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	map("n", "]e", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	-- vim.keymap.del("n", "grr")

	map({ "n", "v" }, "<leader>lf", require("utils.lsp.operations").format, { silent = true, desc = "Format" })
	map("n", "gd", require("utils.lsp.operations").goto_definition, { desc = "Goto Definition" })
	map("n", "gD", require("utils.lsp.operations").goto_declaration, { desc = "Goto Declaration" })
	map("n", "grr", require("utils.lsp.operations").goto_references, { desc = "Goto References" })
	map("n", "gR", require("utils.lsp.operations").goto_file_references, { desc = "Goto File References" })
	map("n", "gt", require("utils.lsp.operations").goto_type_definition, { desc = "Goto Type Definition" })
	map("n", "gI", require("utils.lsp.operations").goto_implementations, { desc = "Goto Implementations" })
	map("n", "<leader>li", require("utils.lsp.operations").goto_incoming_calls, { desc = "Goto Incoming Calls" })
	map("n", "<leader>lo", require("utils.lsp.operations").goto_outgoing_calls, { desc = "Goto Outgoing Calls" })
	map("n", "<leader>lr", require("utils.lsp.operations").rename, { silent = true, desc = "Rename" })
	map("n", "<leader>la", vim.lsp.buf.code_action, { silent = true, desc = "Code Actions" })
	map("n", "<leader>lR", require("utils.lsp.operations").rename_file, { desc = "Rename File" })
	map("n", "<leader>cf", require("utils.lsp.operations").fixAll, { desc = "Fix All" })
	map("n", "<leader>cc", require("utils.lsp.operations").removeUnused, { desc = "Remove Unused" })
	map("n", "<leader>cC", require("utils.lsp.operations").removeUnusedImports, { desc = "Remove Unused Imports" })
	map("n", "<leader>ci", require("utils.lsp.operations").addMissingImports, { desc = "Add Missing Imports" })
	map(
		"n",
		"<leader>sS",
		"<cmd>FzfLua lsp_live_workspace_symbols previewer=builtin<cr>",
		{ desc = "Workspace Symbols" }
	)
	map("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Document Symbols" })
	map(
		"n",
		"<leader>lth",
		require("utils.lsp.operations").toggle_inlay_hints,
		{ desc = "Toggle Inlayhints", silent = true }
	)
	-- map("n", "<leader>ltl", "<cmd>LspLensToggle<cr>", { desc = "Toggle function hints", silent = true })
	map({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
end

function M.bufremove()
	map("n", "<leader>d", function()
		MiniBufremove.delete(0)
	end, { desc = "Delete Buffer" })
	map("n", "<leader>D", function()
		MiniBufremove.delete(0, true)
	end, { desc = "Force Delete Buffer" })
end

function M.rainbiow()
	map("n", "<leader>tr", function()
		require("rainbow-delimiters").toggle()
	end, { desc = "Toggle Rainbow Delimiters" })
end

function M.agitator()
	map("n", "<leader>g,g", function()
		require("agitator").search_git_branch()
	end, { desc = "Grep in branch" })
	map("n", "<leader>g,f", function()
		require("agitator").open_file_git_branch()
	end, { desc = "Open file in branch" })
	map("n", "<leader>g,m", function()
		require("agitator").git_time_machine()
	end, { desc = "Time machine" })
end

return M
