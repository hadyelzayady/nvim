local M = {}
local map = vim.keymap.set

function M.setup()
	-- Nvim options Toggle
	map("n", "<leader>to", function()
		vim.o.scrolloff = 999 - vim.o.scrolloff
	end)
	map("n", "<leader>th", "<cmd>TSToggle highlight<CR>", { desc = "Toggle Treesitter highlight" })
	-- end Nvim options Toggle

	map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
	-- resize
	map("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
	map("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
	map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
	map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
	-- end resize
	--
	-- navigation
	map("n", "<leader>E", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "NvimTree Find File Toggle" })
	map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
	map("n", "<c-,>", "<cmd>cnext<CR>", { desc = "Next Quickfix Item" })
	map("n", "<c-.>", "<cmd>cprevious<CR>", { desc = "Prev Quickfix Item" })
	map("n", "<c-q>", function()
		vim.cmd("cclose")
		vim.cmd("TroubleClose")
		vim.cmd("silent! lua require('neogit').close()")
	end, { desc = "Close Common Splits" })

	map("n", "<C-e>", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })
	map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find File" })
	map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find Buffer" })
	map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
	map("n", "<leader>ft", "<cmd>FzfLua filetypes<cr>", { desc = "File Types" })
	map("n", "<leader>sm", "<cmd>FzfLua marks<cr>", { desc = "Search Marks" })
	map("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil" })

	map("n", "<leader>cS", "<cmd>AerialToggle<cr>", { silent = true, desc = "Symbole Outline" })
	map("n", "<leader>cs", "<cmd>AerialNavToggle<cr>", { silent = true, desc = "Symbole Nav" })
	-- end navigation

	-- search
	map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Search Current Word (project)" })
	map("n", "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Search Buffer" })
	map("n", "<leader>sp", "<cmd>FzfLua grep_project<cr>", { desc = "Search Project" })
	map({ "n", "v" }, "<leader>sv", "<cmd>FzfLua grep_visual<cr>", { desc = "Search Visual", noremap = true })
	map("n", "<leader>sg", "<cmd>FzfLua live_grep_glob<cr>", { desc = "Grep" })
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
	map("n", "<leader>gD", ":DiffviewOpen<cr>", { desc = "Diff" })
	map("n", "<leader>gd", ":DiffviewOpen -- %<cr>", { desc = "Diff file" })
	map("n", "<leader>gc", "<cmd>FzfLua git_branches<CR>", { desc = "Checkout Branch" })
	map("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "Buffer History" })
	map("v", "<leader>gh", ":'<,'>DiffviewFileHistory %<CR>", { desc = "Range Buffer History" })
	map("n", "<leader>gn", "<cmd>Neogit<CR>", { desc = "Neogit" })
	map("n", "<leader>gb", ":Gitsigns blame_line<cr>", { desc = "Blame Current Line" })
	map("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Blame Toggle Show Current Line" })
	map("n", "<leader>gp", ":Gitsigns preview_hunk_inline<cr>", { desc = "Preview Hunk Inline" })
	map("n", "<leader>gj", ":silent! Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
	map("n", "<leader>gk", ":silent! Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
	map("n", "]g", ":Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
	map("n", "[g", ":Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
	map("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", { desc = "Reset Hunk", silent = true })
	map("n", "<leader>gR", ":Gitsigns reset_buffer<cr>", { desc = "Reset Buffer" })
	map("n", "<leader>gs", ":Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
	map("n", "<leader>gS", ":Gitsigns undo_stage_hunk<cr>", { desc = "UnStage Hunk" })
	-- End Git

	-- quit/session/projects
	map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
	map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
	map("n", "<leader>Q", "<cmd>silent! qa!<cr>", { desc = "Force Quit all" })
	map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
	map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })
	-- end quit/session/projects

	M.lsp()
end

function M.lsp()
	local opts = { silent = true }
	map("n", "gd", require("utils.lsp.operations").goto_definition, { desc = "Goto Definition" })
	map("n", "gD", require("utils.lsp.operations").goto_declaration)
	map("n", "gr", require("utils.lsp.operations").goto_references)
	map("n", "gR", require("utils.lsp.operations").goto_file_references)
	map("n", "gt", require("utils.lsp.operations").goto_type_definition)
	map("n", "gI", require("utils.lsp.operations").goto_implementations)
	map("n", "<leader>li", require("utils.lsp.operations").goto_incoming_calls)
	map("n", "<leader>lo", require("utils.lsp.operations").goto_outgoing_calls)
	-- map("n", "K", require("plugins.lsp.operations").hover)
	map("n", "<leader>lr", require("utils.lsp.operations").rename, opts)
	map("n", "<leader>lR", require("utils.lsp.operations").rename_file, opts)
	map("n", "<leader>cf", require("utils.lsp.operations").fixAll, opts)
	map("n", "<leader>cc", require("utils.lsp.operations").removeUnused, opts)
	map("n", "<leader>cC", require("utils.lsp.operations").removeUnusedImports, opts)
	map("n", "<leader>ci", require("utils.lsp.operations").addMissingImports, opts)
	map(
		"n",
		"<leader>lth",
		require("utils.lsp.operations").toggle_inlay_hints,
		{ desc = "Toggle Inlayhints", silent = true }
	)
	map("n", "<leader>ltl", "<cmd>LspLensToggle<cr>", { desc = "Toggle function hints", silent = true })
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

return M
