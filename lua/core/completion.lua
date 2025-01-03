
local function show_doc_preview()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/hover', params, function(_, result, ctx, config)
    if not (result and result.contents) then
      print("No documentation available.")
      return
    end
    -- print(vim.inspect(result))
    -- Close existing hover windows if valid
    if vim.w.hover_win and vim.api.nvim_win_is_valid(vim.w.hover_win) then
      vim.api.nvim_win_close(vim.w.hover_win, true)
    end

    -- Create hover window only if there is valid content
    local popup_opts = {
      border = "rounded",
      focusable = false,
      relative = "editor",
      anchor = "NW",
      row = 1,
      col = vim.o.columns - 50, -- Adjust position as needed
      width = 50,
      height = 20,
    }

    vim.w.hover_win = vim.lsp.util.open_floating_preview(result.contents, "markdown", popup_opts)
  end)
end
-- Keybinding to show hover documentation
vim.keymap.set('i', '<C-k>',function ()
	show_doc_preview()
end , { noremap = true, silent = true })

-- Enable documentation on completion item selection
vim.o.completeopt = "menu,menuone,noselect"
vim.cmd([[
  augroup LspDocumentation
    autocmd!
    autocmd CompleteDone * if pumvisible() == 0 | lua vim.lsp.buf.hover() | endif
  augroup END
]])
