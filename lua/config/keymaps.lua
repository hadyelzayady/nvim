local map = require('utils.functions').map

map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>ws", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>wv", "<C-W>v", { desc = "Split window right" })

-- Move Lines
-- map("n", "<C-S>j>", ":m .+1<cr>==", { desc = "Move down" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<C-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })
-- map("n", "<C-k>", ":m .-2<cr>==", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin buffer" })
map("n", "<leader>bj", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })
map("n", "<leader>bo", "<cmd>execute 'BufferLineCloseRight' | BufferLineCloseLeft<cr>", { desc = "Delete Other Buffers" })
map("n", "<leader>ba", function()
    vim.cmd("BufferLineCloseLeft")
    vim.cmd("BufferLineCloseRight")
    require("mini.bufremove").delete(0, false)
  end,
  { desc = "Delete All Buffers" })
map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Right Buffers" })
map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete Left Buffers" })

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
map("n", "<C-e>", ":FzfLua oldfiles<cr>", { desc = "Recent Files" })
map("n", "<leader>ff", "<cmd>lua require('utils.find').find_project_files()<cr>", { desc = "Find File" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find Buffer" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>fm", "<cmd>FzfLua marks<cr>", { desc = "marks" })

-- search
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Search Current Word (project)" })
map("n", "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Search Buffer" })
map("n", "<leader>sp", "<cmd>FzfLua grep_project<cr>", { desc = "Search Project" })
map("n", "<leader>sv", "<cmd>FzfLua grep_visual<cr>", { desc = "Search Visual" })
map("n", "<leader>sg", "<cmd>FzfLua live_grep_native<cr>", { desc = "Grep" })


-- quit/session/projects
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>qQ", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>Q", "<cmd>silent! qa!<cr>", {desc = "Force Quit all" })
map("n", "<leader>qp", "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", { desc = "Find Project" })
map("n", "<leader>qw", "<cmd>silent! wall<cr>", { desc = "Save All" })
map("n", "<leader>qW", "<cmd>silent! w<cr>", { desc = "Save Current" })

-- Git
map("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gn", "<cmd><CR>", { desc = "Lazygit", silent = true })
map("n", "<leader>gd", ":DiffviewOpen -- %<cr>", { desc = "Diff file" })
map("n", "<leader>gc", "<cmd>FzfLua git_branches<CR>", { desc = "Checkout Branch" })
map("n", "<leader>gu", "<cmd>Gin pull<CR>", { desc = "Pull" })
map("n", "<leader>gU", "<cmd>Gin push<CR>", { desc = "Push" })
map({ "n", "v" }, "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Buffer History" })
map("n", "<leader>gn", "<cmd>Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>ga", "<cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>",
  { desc = "Co-authors" })

-- -- Debug
-- map("n", "<leader>rd", "<cmd>DapContinue<CR>", { desc = "Debug" })
-- map("n", "<leader>ru", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle Ui" })

-- Jump
map("n", "<leader>jl", "<cmd>HopLine<CR>", { desc = "Line" })
map("n", "<leader>jj", "<cmd>HopChar2<CR>", { desc = "word" })

--  History
map("n", "<leader>h", "<cmd>UndotreeToggle<CR>", { desc = "history" })

-- remap to open the Telescope refactoring menu in visual mode
map(
  "v",
  "<leader>rr",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)

map("n", "<leader>mf", "<cmd>FzfLua filetypes<CR>", { desc = "File Types" })
map("n", "<leader>uc", "<cmd>lua require('utils.toggle').toggle_conceal()<CR>", { desc = "Toggle Conceal" })


-- Lists
map("n", "<leader>xt", "<cmd>lua require('utils.toggle').toggle_conceal()<CR>", { desc = "Toggle Conceal" })
map("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics <CR>", { desc = "Document Diagnostics" })
map("n", "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics <CR>", { desc = "Workspace Diagnostics" })


-- terminal
map("n", "<leader>ts", ":ToggleTerm direction=horizontal<CR>", { desc = "Horizontal Terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical Terminal" })
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { desc = "Tab Terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Float Terminal" })

-- toggle/reveal
map("n", "<leader>nr", "<cmd>Neotree reveal<cr>", { desc = "Reveal File" })

local M = {}
function M.lsp_global_setup()
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { silent = true }
  map('n', '<leader>ld', vim.diagnostic.open_float, opts)
  map({ 'n', 'v' }, '<leader>la', "<cmd>FzfLua lsp_code_actions<cr>", { silent = true, desc = "Code Action" })
  map('n', '<leader>ss', "<cmd>FzfLua lsp_document_symbols<cr>",
    { silent = true, desc = "Document Symboles" })
  map('n', '<leader>sS', "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
    { silent = true, desc = "Workspace Symboles" })

  map('n', '<leader>cs', "<cmd>AerialToggle<cr>", { silent = true, desc = "Symbole Outline" })
  map('n', '<leader>cS', "<cmd>AerialNavToggle<cr>", { silent = true, desc = "Symbole Nav" })

  map('n', '[d', vim.diagnostic.goto_prev, opts)
  map('n', ']d', vim.diagnostic.goto_next, opts)


  map("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
  map("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)

  map("n", "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, opts)
  map("n", "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, opts)

  map("n", "[i", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO }) end, opts)
  map("n", "]i", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO }) end, opts)

  map("n", "[h", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT }) end, opts)
  map("n", "]h", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT }) end, opts)
end

function M.on_attach_setup(ev)
  local opts = { buffer = ev.buf, silent = true }
  -- Lua
  map('n', 'gd', '<CMD>Glance definitions<CR>')
  map('n', 'gr', '<CMD>Glance references<CR>')
  map('n', 'gt', '<CMD>Glance type_definitions<CR>')
  map('n', 'gI', '<CMD>Glance implementations<CR>')

  map('n', 'gD', vim.lsp.buf.declaration, opts)
  -- map('n', 'K', vim.lsp.buf.hover, opts)
        -- Setup keymaps
  vim.keymap.set('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      -- choose one of coc.nvim and nvim lsp
      require("hover").hover()
    end
  end)

  vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})

  -- map('n', 'gi', vim.lsp.buf.implementation, opts)
  map({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help, opts)
  map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  map('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  map('n', '<leader>lf', function() require('plugins.lsp.utils').format(ev.buf) end,
    { silent = true, desc = "Format" })

  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<cr>",
      { buffer = ev.buf, desc = "Organize Imports" })
    vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<cr>", { desc = "Rename File", buffer = ev.buf })
    vim.keymap.set("n", "<leader>cf", "<cmd>EslintFixAll<cr>", { desc = "Fix All", buffer = ev.buf })
    vim.keymap.set("n", "<leader>cc", ":TypescriptRemoveUnused<cr>", { desc = "Clean Code", buffer = ev.buf })
    vim.keymap.set("n", "<leader>ci", ":TypescriptAddMissingImports<cr>", { desc = "Add Imports", buffer = ev.buf })
  end
end

function M.hlslens_setup()
  local kopts = { noremap = true, silent = true }

  vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
  vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
  vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

  -- vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
end

function M.goto_preview_setup()
  local opts = { noremap = true, silent = true }
  map('n', "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
  map('n', "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
  map('n', "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
  map('n', "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
  map('n', "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
end

function M.split_join_setup()
  map('n', 'gs', require('treesj').toggle)
end

function M.search_replace_setup()
  local opts = {}
  vim.api.nvim_set_keymap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", opts)
  vim.api.nvim_set_keymap("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
  vim.api.nvim_set_keymap("v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", opts)

  vim.api.nvim_set_keymap("n", "<leader>rs", "<CMD>SearchReplaceSingleBufferSelections<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>ro", "<CMD>SearchReplaceSingleBufferOpen<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>re", "<CMD>SearchReplaceSingleBufferCExpr<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rf", "<CMD>SearchReplaceSingleBufferCFile<CR>", opts)

  vim.api.nvim_set_keymap("n", "<leader>rbs", "<CMD>SearchReplaceMultiBufferSelections<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rbw", "<CMD>SearchReplaceMultiBufferCWord<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rbW", "<CMD>SearchReplaceMultiBufferCWORD<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rbe", "<CMD>SearchReplaceMultiBufferCExpr<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rbf", "<CMD>SearchReplaceMultiBufferCFile<CR>", opts)
end

function M.terminal_keymaps()
  local opts = { buffer = 0 }
  map('t', '<esc>', [[<C-\><C-n>]], opts)
  map('t', 'jk', [[<C-\><C-n>]], opts)
  map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  map('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

return M
