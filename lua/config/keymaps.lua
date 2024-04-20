local map = require("utils.functions").map

map("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "x", '"_x', { silent = true })
map("n", "X", '"_X', { silent = true })
map("v", "x", '"_x', { silent = true })
map("v", "X", '"_X', { silent = true })
map("v", "p", '"_dP', { silent = true })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

map("n", "<C-e>", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })
map("n", "<leader>ff", "<cmd>lua require('utils.find').find_project_files()<cr>", { desc = "Find File" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find Buffer" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>fm", "<cmd>FzfLua marks<cr>", { desc = "marks" })
map("n", "<leader>ft", "<cmd>FzfLua filetypes<cr>", { desc = "file types" })

map("n", "<leader>frf", "<Plug>CtrlSFPrompt")
map("v", "<leader>frw", "<Plug>CtrlSFVwordPath", { desc = "Current Selected Word" })
map("n", "<leader>frw", "<Plug>CtrlSFCwordPath", { desc = "Current word" })
map("n", "<leader>frW", "<Plug>CtrlSFCCwordPath", { desc = "Current word (Exactly)" })
map("n", "<leader>fr/", "<Plug>CtrlSFPwordPath", { desc = "Last search word" })
map("n", "<leader>fro", ":CtrlSFOpen<CR>")
map("n", "<leader>frt", ":CtrlSFToggle<CR>")

-- neotree (file explorer)
map("n", "<leader>e", "<cmd>Neotree reveal=true toggle=true<cr>", { desc = "File Explorer" })

map("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "File Explorer Reveal" })
-- Tab
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
-- search
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Search Current Word (project)" })
map("n", "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Search Buffer" })
map("n", "<leader>sp", "<cmd>FzfLua grep_project<cr>", { desc = "Search Project" })
map({ "n", "v" }, "<leader>sv", "<cmd>FzfLua grep_visual<cr>", { desc = "Search Visual", noremap = true })
map("n", "<leader>sg", "<cmd>FzfLua live_grep_glob<cr>", { desc = "Grep" })
map("n", "*", ":keepjumps normal! mi*`i<CR>")
map("n", "<leader>sq", function()
	vim.cmd('g//caddexpr expand("%") . ":" . line(".") . ":" . getline(".")')
	vim.cmd("copen")
end, { desc = "Send Matched Lines to Quickfix" })
-- quit/session/projects
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>Q", "<cmd>silent! qa!<cr>", { desc = "Force Quit all" })
map("n", "<leader>qp", "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", { desc = "Find Project" })
map("n", "<leader>qs", "<cmd>Telescope possession list<cr>", { desc = "Find Session" })
map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })
map("n", "<leader>qd", "<cmd>Veil<cr>", { desc = "Dashboard" })

-- Pickers
map("n", "<leader>pc", "<cmd>CccPick<CR>", { desc = "Color Picker", silent = true })
map("n", "<leader>pt", "<cmd>FzfLua filetypes<CR>", { desc = "Filetype Picker", silent = true })

-- Git
map("n", "<leader>gg", "<cmd>Lazygit<CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gG", "<cmd>Gitui<CR>", { desc = "Gitui", silent = true })
map("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "Diff" })
map("n", "<leader>gD", ":DiffviewOpen -- %<cr>", { desc = "Diff file" })
map("n", "<leader>gc", "<cmd>FzfLua git_branches<CR>", { desc = "Checkout Branch" })
map("n", "<leader>gu", "<cmd>Gin pull<CR>", { desc = "Pull" })
map("n", "<leader>gU", "<cmd>Gin push<CR>", { desc = "Push" })
map("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Buffer History" })
map("v", "<leader>gh", ":'<,'>DiffviewFileHistory %<CR>", { desc = "Range Buffer History" })
map("n", "<leader>gn", "<cmd>Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>gts", "<cmd>lua require('tinygit').searchFileHistory()<CR>", { desc = "Search File History" })
map("n", "<leader>gtf", "<cmd>lua require('tinygit').functionHistory()<CR>", { desc = "Function History" })
map("n", "<leader>ga", require("utils.git").list, { desc = "Co-authors" })
map("n", "<leader>gw", "<cmd>Telescope git_worktree git_worktrees<cr>", { desc = "List Worktree" })
map("n", "<leader>gW", "<cmd>Telescope git_worktree create_git_worktree<cr>", { desc = "Create Worktree" })

-- -- Debug
-- map("n", "<leader>rd", "<cmd>lua require('dap').continue()<CR>", { desc = "Debug" })
-- map("n", "<leader>rb", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
-- map("n", "<leader>ru", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle Ui" })

map("n", "<c-,>", "<cmd>cnext<CR>", { desc = "Next Quickfix Item" })
map("n", "<c-.>", "<cmd>cprevious<CR>", { desc = "Prev Quickfix Item" })
map("n", "<c-q>", function()
	vim.cmd("cclose")
	vim.cmd("TroubleClose")
	vim.cmd("silent! lua require('neogit').close()")
end, { desc = "Close Common Splits" })

--  History
map("n", "<leader>h", "<cmd>UndotreeToggle<CR>", { desc = "history" })

map({ "n", "v" }, "<leader>lf", require("plugins.lsp.operations").format, { silent = true, desc = "Format" })

-- lists
map("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr> ", { silent = true, desc = "Format" })
map("n", "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr> ", { silent = true, desc = "Format" })
-- toggle misc
map("n", "<leader>nc", "<cmd>TSContextToggle<CR>", { desc = "Context" })
map("n", "<leader>nh", "<cmd>CccHighlighterToggle<CR>", { desc = "Color Highlight" })

-- refactor
map({ "n", "x" }, "<leader>cr", function()
	require("refactoring").select_refactor()
end, { desc = "Refactor" })

map("n", "<leader>lg", "<cmd>lua require('logsitter').log()<cr>", { desc = "Log" })

-- map("n", "<leader>Se", function() require("scissors").editSnippet() end)
-- --visual mode prefills the selection as body.
-- map({ "n", "x" }, "<leader>Sa", function() require("scissors").addNewSnippet() end)

local M = {}
function M.oil()
	map("n", "-", require("oil").open, { desc = "Open parent directory" })
end

function M.lsp_global_setup()
	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { silent = true }
	map("n", "<leader>ld", vim.diagnostic.open_float, { silent = true, desc = "Show Diagnostic" })
	map({ "n", "v" }, "<leader>la", "<cmd>FzfLua lsp_code_actions<cr>", { silent = true, desc = "Code Action" })
	map("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", { silent = true, desc = "Document Symboles" })
	map("n", "<leader>sS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { silent = true, desc = "Workspace Symboles" })

	map("n", "<leader>cS", "<cmd>AerialToggle<cr>", { silent = true, desc = "Symbole Outline" })
	map("n", "<leader>cs", "<cmd>AerialNavToggle<cr>", { silent = true, desc = "Symbole Nav" })

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

	-- map("n", "[i", function()
	-- 	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO })
	-- end, opts)
	-- map("n", "]i", function()
	-- 	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO })
	-- end, opts)

	map("n", "[h", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT })
	end, opts)
	map("n", "]h", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT })
	end, opts)
end
function M.on_attach_setup(ev)
	local opts = { silent = true }
	map("n", "gd", require("plugins.lsp.operations").goto_definition, { desc = "Goto Definition" })
	map("n", "gD", require("plugins.lsp.operations").goto_declaration)
	map("n", "gr", require("plugins.lsp.operations").goto_references)
	map("n", "gR", require("plugins.lsp.operations").goto_file_references)
	map("n", "gt", require("plugins.lsp.operations").goto_type_definition)
	map("n", "gI", require("plugins.lsp.operations").goto_implementations)
	map("n", "<leader>li", require("plugins.lsp.operations").goto_incoming_calls)
	map("n", "<leader>lo", require("plugins.lsp.operations").goto_outgoing_calls)
	map("n", "K", require("plugins.lsp.operations").hover)
	map("n", "<leader>lr", require("plugins.lsp.operations").rename, opts)
	map("n", "<leader>lR", require("plugins.lsp.operations").rename_file, opts)
	map("n", "<leader>cf", require("plugins.lsp.operations").fixAll, opts)
	map("n", "<leader>cc", require("plugins.lsp.operations").removeUnused, opts)
	map("n", "<leader>cC", require("plugins.lsp.operations").removeUnusedImports, opts)
	map("n", "<leader>ci", require("plugins.lsp.operations").addMissingImports, opts)
	map(
		"n",
		"<leader>lth",
		require("plugins.lsp.operations").toggle_inlay_hints,
		{ desc = "Toggle Inlayhints", silent = true }
	)
	map("n", "<leader>ltl", "<cmd>LspLensToggle<cr>", { desc = "Toggle function hints", silent = true })
	map({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
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
	map("n", "gpr", "<cmd>FzfLua lsp_references<CR>", opts)
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

function M.rest_nvim_keymaps()
	map({ "n", "v" }, "<leader>r", "<Plug>RestNvim", { desc = "Run Request", buffer = true })
	map({ "n" }, "<leader>p", "<Plug>RestNvimPreview", { desc = "Preview The Curl Command", buffer = true })
	map("n", "<leader>R", "<Plug>RestNvimLast", { desc = "Rerun The Last Request", buffer = true })
end

function M.terminal_keymap()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

function M.bufremove()
	map("n", "<leader>d", function()
		MiniBufremove.delete(0)
	end, { desc = "Delete Buffer" })
	map("n", "<leader>D", function()
		MiniBufremove.delete(0, true)
	end, { desc = "Force Delete Buffer" })
end

function M.packages_file_keymaps(operations)
	map("n", "<leader>Ps", operations.show, { desc = "Show", buffer = true })
	map("n", "<leader>Ph", operations.hide, { desc = "Hide", buffer = true })
	map("n", "<leader>Pt", operations.toggle, { desc = "Toggle", buffer = true })
	if operations.update then
		map("n", "<leader>Pu", operations.update, { desc = "Update Package", buffer = true })
	end
	if operations.delete then
		map("n", "<leader>Pd", operations.delete, { desc = "Delete Package", buffer = true })
	end
	if operations.install then
		map("n", "<leader>Pi", operations.install, { desc = "Install Package", buffer = true })
	end
	map("n", "<leader>Pv", operations.version, { desc = "Show Versions", buffer = true })
end

function M.harpoon()
	local harpoon = require("harpoon")
	map("n", "<leader>ja", function()
		harpoon:list():append()
	end)
	vim.keymap.set("n", "<leader>jj", function()
		-- harpoon.ui:toggle_quick_menu(harpoon:list())
		vim.cmd("Telescope grapple tags")
	end)
end

function M.grapple()
	-- Lua
	vim.keymap.set("n", "<leader>m", require("grapple").toggle)
	vim.keymap.set("n", "<leader>M", require("grapple").toggle_tags)

	-- User command
	vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")
	vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<cr>")
	vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<cr>")
end
---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
		return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
	end
	return config
end
function M.dap()
	map("n", "<leader>rB", function()
		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, { desc = "Breakpoint Condition" })
	map("n", "<leader>rb", function()
		require("dap").toggle_breakpoint()
	end, { desc = "Toggle Breakpoint" })
	map("n", "<leader>rc", function()
		require("dap").continue()
	end, { desc = "Continue" })
	map("n", "<leader>ra", function()
		require("dap").continue({ before = get_args })
	end, { desc = "Run with Args" })
	map("n", "<leader>rC", function()
		require("dap").run_to_cursor()
	end, { desc = "Run to Cursor" })
	map("n", "<leader>rg", function()
		require("dap").goto_()
	end, { desc = "Go to line (no execute)" })
	map("n", "<leader>ri", function()
		require("dap").step_into()
	end, { desc = "Step Into" })
	map("n", "<leader>rj", function()
		require("dap").down()
	end, { desc = "Down" })
	map("n", "<leader>rk", function()
		require("dap").up()
	end, { desc = "Up" })
	map("n", "<leader>rl", function()
		require("dap").run_last()
	end, { desc = "Run Last" })
	map("n", "<leader>ro", function()
		require("dap").step_out()
	end, { desc = "Step Out" })
	map("n", "<leader>rO", function()
		require("dap").step_over()
	end, { desc = "Step Over" })
	map("n", "<leader>rp", function()
		require("dap").pause()
	end, { desc = "Pause" })
	map("n", "<leader>rr", function()
		require("dap").repl.toggle()
	end, { desc = "Toggle REPL" })
	map("n", "<leader>rs", function()
		require("dap").session()
	end, { desc = "Session" })
	map("n", "<leader>rx", function()
		require("dap").terminate()
	end, { desc = "Terminate" })
	map("n", "<leader>rw", function()
		require("dap.ui.widgets").hover()
	end, { desc = "Widgets" })
end

function M.dapui()
	map("n", "<leader>rU", function()
		require("dapui").toggle()
	end, { desc = "Toggle UI" })
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

function M.window_picker()
	map("n", "<leader>w", require("window-picker").pick_window, { desc = "Show Output" })
end
return M
