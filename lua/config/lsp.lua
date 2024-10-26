local M = {}

--Enable (broadcasting) snippet capability for completion
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = false }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    client.server_capabilities.documentHighlightProvider = false
    -- Function to set up LSP keymaps for each buffer
    -- Helper function to map keys
    local buf_set_keymap = vim.keymap.set
    local opts = { noremap = true, silent = true, buffer = true }

    -- Mappings.
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)             -- Go to definition
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)            -- Go to declaration
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)         -- Go to implementation
    buf_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", opts) -- Go to implementation
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)          -- Find references
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)                   -- Hover documentation
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)      -- Signature help
    -- buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Code action
    -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- Show diagnostics
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) -- Go to previous diagnostic
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) -- Go to next diagnostic

    buf_set_keymap("n", "[w", function()
      vim.diagnostic.jump({
        severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.WARN },
        count = -1, -- For previous diagnostic
      })
    end, opts)
    buf_set_keymap("n", "]w", function()
      vim.diagnostic.jump({
        severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.WARN },
        count = 1, -- For previous diagnostic
      })
    end, opts)
    buf_set_keymap("n", "[e", function()
      vim.diagnostic.jump({
        severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR },
        count = -1, -- For previous diagnostic
      })
    end, opts)
    buf_set_keymap("n", "]e", function()
      vim.diagnostic.jump({
        severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR },
        count = 1, -- For previous diagnostic
      })
    end, opts)
  end,
})


return M
