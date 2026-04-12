-- Built-in autocompletion using Neovim's native LSP completion
-- vim.lsp.completion module (Neovim 0.10+)

-- Enable LSP completion
vim.lsp.completion.enable(true)

-- Completion configuration
vim.lsp.completion.on_attach = function(client, bufnr)
  -- Auto-trigger completion
end

-- Merge LSP completions withvim.snippet expand
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Use tab to select completion
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if vim.fn.pumvisible() == 1 then
      vim.api.nvim_feedkeys(vim.keycode("<C-n>"), "n", false)
    end
  end,
})

-- Confirm completion with Enter
vim.api.nvim_create_autocmd("InsertCharPre", {
  callback = function()
    if vim.fn.pumvisible() == 1 and vim.v.char == "\r" then
      vim.v.char = ""
      vim.api.nvim_feedkeys(vim.keycode("<C-y>"), "n", false)
    end
  end,
})

-- Snippet expansion (built-in)
-- Requires LSP server to support textDocument.completion
vim.opt.snippets = {
  ads = "",
  ai = "",
  bil = "",
}

-- Completion window settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "javascript", "typescript" },
  callback = function(args)
    vim.opt_local.completeopt = "menu,menuone,noselect"
  end,
})