local map = require("utils.functions").map

-- map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>ws", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>wv", "<C-W>v", { desc = "Split window right" })
vim.keymap.set("n", "<leader>wp", function()
	local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
	vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })
-- Don't yank on delete char
map("n", "x", '"_x', { silent = true })
map("n", "X", '"_X', { silent = true })
map("v", "x", '"_x', { silent = true })
map("v", "X", '"_X', { silent = true })

-- Don't yank on visual paste
map("v", "p", '"_dP', { silent = true })
-- Move Lines
-- map("n", "<C-S>j>", ":m .+1<cr>==", { desc = "Move down" })
map("v", "<C-J>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-K>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- map("i", "<C-J>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<C-K>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })
-- map("n", "<C-K>", ":m .-2<cr>==", { desc = "Move up" })
-- map("n", "<C-J>", ":m .+1<cr>==", { desc = "Move down" })

-- buffers
-- map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
-- map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
-- map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin buffer" })
-- map("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })
-- map("n", "<leader>bo", "<cmd>execute 'BufferLineCloseRight' | BufferLineCloseLeft<cr>", { desc = "Delete Other Buffers" })
-- map("n", "<leader>ba", function()
--     vim.cmd("BufferLineCloseLeft")
--     vim.cmd("BufferLineCloseRight")
--     require("mini.bufremove").delete(0, false)
--   end,
--   { desc = "Delete All Buffers" })
-- map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Right Buffers" })
-- map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete Left Buffers" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- files/find
-- map("n", "<C-e>", ":lua require('telescope.builtin').oldfiles { only_cwd = true }<cr>", { desc = "Recent Files" })
map("n", "<C-e>", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })
map("n", "<leader>ff", "<cmd>lua require('utils.find').find_project_files()<cr>", { desc = "Find File" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find Buffer" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>fm", "<cmd>FzfLua marks<cr>", { desc = "marks" })
-- map("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { desc = "Resume find" })

map("n", "<leader>frf", "<Plug>CtrlSFPrompt")
map("v", "<leader>frw", "<Plug>CtrlSFVwordPath", { desc = "Current Selected Word" })
map("n", "<leader>frw", "<Plug>CtrlSFCwordPath", { desc = "Current word" })
map("n", "<leader>frW", "<Plug>CtrlSFCCwordPath", { desc = "Current word (Exactly)" })
map("n", "<leader>fr/", "<Plug>CtrlSFPwordPath", { desc = "Last search word" })
map("n", "<leader>fro", ":CtrlSFOpen<CR>")
map("n", "<leader>frt", ":CtrlSFToggle<CR>")
-- map("i", "<leader>frt", "<Esc>:CtrlSFToggle<CR>")

-- search
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Search Current Word (project)" })
map("n", "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Search Buffer" })
map("n", "<leader>sp", "<cmd>FzfLua grep_project<cr>", { desc = "Search Project" })
map({ "n", "v" }, "<leader>sv", "<cmd>FzfLua grep_visual<cr>", { desc = "Search Visual", noremap = true })
map("n", "<leader>sg", "<cmd>FzfLua live_grep_glob<cr>", { desc = "Grep" })

-- quit/session/projects
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>Q", "<cmd>silent! qa!<cr>", { desc = "Force Quit all" })
map("n", "<leader>qp", "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", { desc = "Find Project" })
map("n", "<leader>qs", "<cmd>Telescope persisted<cr>", { desc = "Find Session" })
map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })
map("n", "<leader>qd", "<cmd>Veil<cr>", { desc = "Dashboard" })

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gn", "<cmd><CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gd", ":DiffviewOpen -- %<cr>", { desc = "Diff file" })
map("n", "<leader>gc", "<cmd>FzfLua git_branches<CR>", { desc = "Checkout Branch" })
map("n", "<leader>gu", "<cmd>Gin pull<CR>", { desc = "Pull" })
map("n", "<leader>gU", "<cmd>Gin push<CR>", { desc = "Push" })
map("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Buffer History" })
map("v", "<leader>gh", ":'<,'>DiffviewFileHistory %<CR>", { desc = "Range Buffer History" })
map("n", "<leader>gn", "<cmd>Neogit<CR>", { desc = "Neogit" })
map(
	"n",
	"<leader>ga",
	"<cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>",
	{ desc = "Co-authors" }
)

-- -- Debug
map("n", "<leader>rd", "<cmd>lua require('dap').continue()<CR>", { desc = "Debug" })
map("n", "<leader>rb", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>ru", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle Ui" })

-- Jump
map("n", "<leader>jl", "<cmd>HopLine<CR>", { desc = "Line" })
map("n", "<leader>jj", "<cmd>HopChar2<CR>", { desc = "word" })
map("n", "<c-,>", "<cmd>cnext<CR>", { desc = "Next Quickfix Item" })
map("n", "<c-.>", "<cmd>cprevious<CR>", { desc = "Prev Quickfix Item" })

--  History
map("n", "<leader>h", "<cmd>UndotreeToggle<CR>", { desc = "history" })

-- remap to open the Telescope refactoring menu in visual mode
map("v", "<leader>R", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", { noremap = true })

map("n", "<leader>mf", "<cmd>FzfLua filetypes<CR>", { desc = "File Types" })

-- map("n", "<leader>uc", "<cmd>lua require('utils.toggle').toggle_conceal()<CR>", { desc = "Toggle Conceal" })
-- map("n", "<leader>uc", "<cmd>lua require('utils.toggle').toggle_conceal()<CR>", { desc = "Toggle Conceal" })

-- Lists
map("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics <CR>", { desc = "Document Diagnostics" })
map("n", "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics <CR>", { desc = "Workspace Diagnostics" })
map("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "Workspace Diagnostics" })

-- terminal
map("n", "<leader>ts", ":ToggleTerm direction=horizontal<CR>", { desc = "Horizontal Terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical Terminal" })
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { desc = "Tab Terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Float Terminal" })

-- toggle/reveal
map("n", "<leader>n*", "<cmd>lua require('utils.toggle').toggle_conceal()<CR>", { desc = "Toggle Conceal" })
map("n", "<leader>nr", "<cmd>Neotree reveal<cr>", { desc = "Reveal File" })
map("n", "<leader>nc", "<cmd>TSContextToggle<cr>", { desc = "Context Toggle" })
map("n", "<leader>nCp", "<cmd>CccPick<cr>", { desc = "Color Picker" })
map("n", "<leader>nCt", "<cmd>CccConvert<cr>", { desc = "Color Convert" })

-- prompt for a refactor to apply when the remap is triggered
vim.keymap.set({ "n", "x" }, "<leader>cr", function()
	require("refactoring").select_refactor()
end)
-- Note that not all refactor support both normal and visual mode
local M = {}
function M.oil()
	map("n", "-", require("oil").open, { desc = "Open parent directory" })
end
function M.lsp_global_setup()
	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { silent = true }
	map("n", "<leader>ld", vim.diagnostic.open_float, opts)
	map({ "n", "v" }, "<leader>la", "<cmd>FzfLua lsp_code_actions<cr>", { silent = true, desc = "Code Action" })
	map("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", { silent = true, desc = "Document Symboles" })
	map("n", "<leader>sS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { silent = true, desc = "Workspace Symboles" })

	map("n", "<leader>cs", "<cmd>AerialToggle<cr>", { silent = true, desc = "Symbole Outline" })
	map("n", "<leader>cS", "<cmd>AerialNavToggle<cr>", { silent = true, desc = "Symbole Nav" })

	map("n", "[d", vim.diagnostic.goto_prev, opts)
	map("n", "]d", vim.diagnostic.goto_next, opts)

	map("n", "[e", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	map("n", "]e", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, opts)

	map("n", "[w", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	end, opts)
	map("n", "]w", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	end, opts)

	map("n", "[i", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO })
	end, opts)
	map("n", "]i", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO })
	end, opts)

	map("n", "[h", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT })
	end, opts)
	map("n", "]h", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT })
	end, opts)
end

function M.on_attach_setup(ev)
	local opts = { buffer = ev.buf, silent = true }
	map("n", "gd", "<CMD>Glance definitions<CR>")
	map("n", "gr", "<CMD>Glance references<CR>")
	map("n", "gt", "<CMD>Glance type_definitions<CR>")
	map("n", "gI", "<CMD>Glance implementations<CR>")

	map("n", "gD", vim.lsp.buf.declaration, opts)
	-- map('n', 'K', vim.lsp.buf.hover, opts)
	-- Setup keymaps
	vim.keymap.set("n", "K", function()
		-- local ok, stats = pcall(require('ufo'))
		-- if ok then
		--   local winid = stats.peekFoldedLinesUnderCursor()
		--   if not winid then
		--     -- choose one of coc.nvim and nvim lsp
		--     require("hover").hover()
		--   end
		--   else
		vim.lsp.buf.hover()
		-- end
	end)

	-- vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })

	-- map('n', 'gi', vim.lsp.buf.implementation, opts)
	map({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
	map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	map("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set({ "n", "v" }, "<leader>lf", function()
		return require("plugins.lsp.format").format()
	end, { silent = true, desc = "Format", expr = true })

	map("n", "<leader>lr", vim.lsp.buf.rename, opts)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if client.name == "tsserver" or client.name == "typescript-tools" then
		vim.keymap.set(
			"n",
			"<leader>co",
			"<cmd>TypescriptOrganizeImports<cr>",
			{ buffer = ev.buf, desc = "Organize Imports" }
		)
		vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<cr>", { desc = "Rename File", buffer = ev.buf })
		vim.keymap.set(
			"n",
			"<leader>cf",
			"mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F",
			{ desc = "Fix All", buffer = ev.buf }
		)
		vim.keymap.set("v", "<leader>cf", ":!eslint_d --stdin --fix-to-stdout<CR>gv", { desc = "Fix", buffer = ev.buf })
		vim.keymap.set("n", "<leader>cc", ":TypescriptRemoveUnused<cr>", { desc = "Clean Code", buffer = ev.buf })
		vim.keymap.set("n", "<leader>ci", ":TypescriptAddMissingImports<cr>", { desc = "Add Imports", buffer = ev.buf })
		return
	end
	if client.name == "vtsls" then
		vim.keymap.set("n", "<leader>cR", "<cmd>VtsExec rename_file<cr>", { desc = "Rename File", buffer = ev.buf })
		vim.keymap.set("n", "<leader>cf", "<cmd>EslintFixAll<cr>", { desc = "Fix All", buffer = ev.buf })
		vim.keymap.set("n", "<leader>cc", ":VtsExec remove_unused<cr>", { desc = "Clean Code", buffer = ev.buf })
		vim.keymap.set("n", "<leader>ci", ":VtsExec add_missing_imports<cr>", { desc = "Add Imports", buffer = ev.buf })
		vim.keymap.set("n", "gR", ":VtsExec file_references<cr>", { desc = "Goto file references", buffer = ev.buf })
		return
	end
	if client.name == "rust_analyzer" then
		vim.keymap.set("n", "<leader>rr", "<cmd>RustRun<cr>", { desc = "Run", buffer = ev.buf })
		vim.keymap.set(
			"n",
			"<leader>cf",
			"<cmd>silent! !cargo fix --allow-dirty<cr>",
			{ desc = "Fix All", buffer = ev.buf }
		)
		-- vim.keymap.set("n", "<leader>cc", ":VtsExec remove_unused<cr>", { desc = "Clean Code", buffer = ev.buf })
		-- vim.keymap.set("n", "<leader>ci", ":VtsExec add_missing_imports<cr>", { desc = "Add Imports", buffer = ev.buf })
		return
	end
end

function M.hlslens_setup()
	local kopts = { noremap = true, silent = true }

	vim.api.nvim_set_keymap(
		"n",
		"n",
		[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
		kopts
	)
	vim.api.nvim_set_keymap(
		"n",
		"N",
		[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
		kopts
	)
	vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

	-- vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
end

function M.goto_preview_setup()
	local opts = { noremap = true, silent = true }
	map("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
	map("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
	map("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
	map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
	map("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
end

function M.split_join_setup()
	map("n", "gs", require("treesj").toggle)
end

function M.search_replace_setup()
	local opts = {}
	vim.api.nvim_set_keymap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", opts)
	vim.api.nvim_set_keymap("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
	vim.api.nvim_set_keymap("v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", opts)

	vim.api.nvim_set_keymap("n", "<leader>srs", "<CMD>SearchReplaceSingleBufferSelections<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>sro", "<CMD>SearchReplaceSingleBufferOpen<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>srw", "<CMD>SearchReplaceSingleBufferCWord<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>srW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>sre", "<CMD>SearchReplaceSingleBufferCExpr<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>srf", "<CMD>SearchReplaceSingleBufferCFile<CR>", opts)

	vim.api.nvim_set_keymap("n", "<leader>srms", "<CMD>SearchReplaceMultiBufferSelections<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>srmo", "<CMD>SearchReplaceMultiBufferOpen<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>srmw", "<CMD>SearchReplaceMultiBufferCWord<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>srmW", "<CMD>SearchReplaceMultiBufferCWORD<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>srme", "<CMD>SearchReplaceMultiBufferCExpr<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>srmf", "<CMD>SearchReplaceMultiBufferCFile<CR>", opts)
end

function M.terminal_keymaps()
	local opts = { buffer = 0 }
	map("t", "<esc>", [[<C-\><C-n>]], opts)
	map("t", "jk", [[<C-\><C-n>]], opts)
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

function M.gitsigns()
	map("n", "<leader>gb", ":Gitsigns blame_line<cr>", { desc = "Blame Current Line" })
	map("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Blame Toggle Show Current Line" })
	map("n", "<leader>gp", ":Gitsigns preview_hunk_inline<cr>", { desc = "Preview Hunk Inline" })
	map("n", "<leader>gj", ":Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
	map("n", "<leader>gk", ":Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
	map("n", "]g", ":Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
	map("n", "[g", ":Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
	map("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", { desc = "Reset Hunk", silent = true })
	map("n", "<leader>gR", ":Gitsigns reset_buffer<cr>", { desc = "Reset Buffer" })
	map("n", "<leader>gs", ":Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
	map("n", "<leader>gS", ":Gitsigns undo_stage_hunk<cr>", { desc = "UnStage Hunk" })
end

M.harpoon_keys = {
	{
		"<leader>ja",
		function()
			require("harpoon.mark").add_file()
		end,
		desc = "Add File",
	},
	{
		"<leader>jm",
		function()
			require("harpoon.ui").toggle_quick_menu()
		end,
		desc = "File Menu",
	},
	{
		"<leader>jn",
		function()
			require("harpoon.ui").nav_next()
		end,
		desc = "Harpoon Next",
	},
	{
		"<leader>jp",
		function()
			require("harpoon.ui").nav_prev()
		end,
		desc = "Harpoon Prev",
	},
	{
		"<leader>1",
		function()
			require("harpoon.ui").nav_file(1)
		end,
		desc = "Harpoon 1",
	},
	{
		"<leader>2",
		function()
			require("harpoon.ui").nav_file(2)
		end,
		desc = "Harpoon 2",
	},
	{
		"<leader>3",
		function()
			require("harpoon.ui").nav_file(3)
		end,
		desc = "Harpoon 3",
	},
	{
		"<leader>4",
		function()
			require("harpoon.ui").nav_file(4)
		end,
		desc = "Harpoon 4",
	},
}

function M.codium()
	map("i", "<C-g>", function()
		return vim.fn["codeium#Accept"]()
	end, { expr = true })
	map("i", "<c-;>", function()
		return vim.fn["codeium#CycleCompletions"](1)
	end, { expr = true })
	map("i", "<c-,>", function()
		return vim.fn["codeium#CycleCompletions"](-1)
	end, { expr = true })
	map("i", "<c-c>", function()
		return vim.fn["codeium#Clear"]()
	end, { expr = true })
end

function M.todo_comments()
	map("n", "]t", function()
		require("todo-comments").jump_next()
	end, { desc = "Next todo comment" })

	map("n", "[t", function()
		require("todo-comments").jump_prev()
	end, { desc = "Previous todo comment" })
end

return M
