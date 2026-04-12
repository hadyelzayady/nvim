-- Autocommands for Neovim v0.12+
-- Native autocmd system

local au = vim.api.nvim_create_augroup("GlobalSettings", { clear = true })

--=============== General Autocommands ===============

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = au,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Check for external file changes
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  group = au,
  callback = function()
    vim.notify("File changed outside of Neovim", vim.log.levels.WARN)
  end,
})

-- Auto-resize splits on window resize
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = au,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Auto-enter insert mode when opening terminal buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = au,
  pattern = { "term://*" },
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Close quickfix/location list when leaving window
-- vim.api.nvim_create_autocmd({ "BufLeave" }, {
--   group = au,
--   pattern = { "*quickfix*" },
--   callback = function()
--     vim.cmd("cclose")
--   end,
-- })

-- Restore cursor position on file open
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  group = au,
  callback = function()
    local exclude = { "gitcommit" }
    local filetype = vim.bo.filetype
    if not vim.tbl_contains(exclude, filetype) then
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end
  end,
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = au,
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Native spell checking (v0.10+)
vim.opt.spell = false
vim.opt.spelllang = "en_us"

-- Don't show quickfix window automatically
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = au,
  pattern = { "qf" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.number = false
  end,
})

-- Close terminal buffer properly
vim.api.nvim_create_autocmd({ "BufDelete" }, {
  group = au,
  pattern = { "term://*" },
  callback = function()
    vim.cmd("sleep 100m")
  end,
})

--=============== Treesitter Autocommands ===============

-- Re-attach Treesitter on file open
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  group = au,
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local ft = vim.bo[buf].filetype
    local ok, parsers = pcall(require, "nvim-treesitter.parsers")
    if ok and parsers.get_parser(buf, ft) then
      vim.treesitter.start(buf, ft)
    end
  end,
})

--=============== LSP Autocommands ===============
-- Native LSP events (v0.11+)

-- Show LSP hover on CursorHold
-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
--   group = au,
--   callback = function()
--     local params = vim.lsp.util.make_text_document_params()
--     vim.lsp.buf.hover(params)
--   end,
-- })
--
-- -- Show line diagnostics on CursorHold
-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
--   group = au,
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false })
--   end,
-- })

--=============== UI Autocommands ===============

-- Center cursor after navigation commands
vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
  group = au,
  callback = function()
    vim.cmd("normal! zz")
  end,
})

--=============== Lazy Loading Autocommands ===============

-- Load plugin configs on first use
-- This keeps startup fast while allowing lazy-loaded plugins
