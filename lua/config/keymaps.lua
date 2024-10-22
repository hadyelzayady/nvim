local M = {}
local map = vim.keymap.set

function M.setup()
  -- navigation
  map("n", "<leader>E", "<cmd>NvimTreeFindFile<CR>", { desc = "NvimTree Find File Toggle" })
  map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree" })
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
  end, { silent = true, desc = "Format" })

  -- format
  map({ "n", "v" }, "<leader>lf", require("utils.lsp.operations").format, { silent = true, desc = "Format" })
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


  map("n", "gd", require("utils.lsp.operations").goto_definition, { desc = "Goto Definition" })
  map("n", "gD", require("utils.lsp.operations").goto_declaration)
  map("n", "gr", require("utils.lsp.operations").goto_references)
  map("n", "gR", require("utils.lsp.operations").goto_file_references)
  map("n", "gt", require("utils.lsp.operations").goto_type_definition)
  map("n", "gI", require("utils.lsp.operations").goto_implementations)
  map("n", "<leader>li", require("utils.lsp.operations").goto_incoming_calls)
  map("n", "<leader>lo", require("utils.lsp.operations").goto_outgoing_calls)
  map("n", "<leader>lr", require("utils.lsp.operations").rename, opts)
  map("n", "<leader>la", vim.lsp.buf.code_action, opts)
  map("n", "<leader>lR", require("utils.lsp.operations").rename_file, opts)
  map("n", "<leader>cf", require("utils.lsp.operations").fixAll, opts)
  map("n", "<leader>cc", require("utils.lsp.operations").removeUnused, opts)
  map("n", "<leader>cC", require("utils.lsp.operations").removeUnusedImports, opts)
  map("n", "<leader>ci", require("utils.lsp.operations").addMissingImports, opts)
  map("n", "<leader>sS", "<cmd>FzfLua lsp_live_workspace_symbols previewer=builtin<cr>", opts)
  map("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", opts)
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

return M
