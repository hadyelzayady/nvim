local map = require("utils.functions").map

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

map("n", "<leader>frf", "<Plug>CtrlSFPrompt")
map("v", "<leader>frw", "<Plug>CtrlSFVwordPath", { desc = "Current Selected Word" })
map("n", "<leader>frw", "<Plug>CtrlSFCwordPath", { desc = "Current word" })
map("n", "<leader>frW", "<Plug>CtrlSFCCwordPath", { desc = "Current word (Exactly)" })
map("n", "<leader>fr/", "<Plug>CtrlSFPwordPath", { desc = "Last search word" })
map("n", "<leader>fro", ":CtrlSFOpen<CR>")
map("n", "<leader>frt", ":CtrlSFToggle<CR>")

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
map("n", "<leader>gd", ":DiffviewOpen -- %<cr>", { desc = "Diff file" })
map("n", "<leader>gc", "<cmd>FzfLua git_branches<CR>", { desc = "Checkout Branch" })
map("n", "<leader>gu", "<cmd>Gin pull<CR>", { desc = "Pull" })
map("n", "<leader>gU", "<cmd>Gin push<CR>", { desc = "Push" })
map("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Buffer History" })
map("v", "<leader>gh", ":'<,'>DiffviewFileHistory %<CR>", { desc = "Range Buffer History" })
map("n", "<leader>gn", "<cmd>Git<CR>", { desc = "Neogit" })
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

map("n", "<c-,>", "<cmd>cnext<CR>", { desc = "Next Quickfix Item" })
map("n", "<c-.>", "<cmd>cprevious<CR>", { desc = "Prev Quickfix Item" })

--  History
map("n", "<leader>h", "<cmd>UndotreeToggle<CR>", { desc = "history" })

map({ "n", "v" }, "<leader>lf", require("plugins.lsp.operations").format, { silent = true, desc = "Format" })

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
	map("n", "gd", require("plugins.lsp.operations").goto_definition)
	map("n", "gD", require("plugins.lsp.operations").goto_declaration)
	map("n", "gr", require("plugins.lsp.operations").goto_references)
	map("n", "gt", require("plugins.lsp.operations").goto_type_definition)
	map("n", "gI", require("plugins.lsp.operations").goto_implementations)
	map("n", "<leader>li", require("plugins.lsp.operations").goto_incoming_calls)
	map("n", "<leader>lo", require("plugins.lsp.operations").goto_outgoing_calls)
	map("n", "K", require("plugins.lsp.operations").hover)
	map("n", "<leader>lr", require("plugins.lsp.operations").rename, opts)
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

return M
