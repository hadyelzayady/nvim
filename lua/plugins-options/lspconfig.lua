local M = {}

function M.config()
  -- Setup language servers.
  require("plugins.lsp.lint").setup()
  require("plugins.lsp.servers_configs").setup()
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  require("config.keymaps").lsp_global_setup()

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      require("config.keymaps").on_attach_setup(ev)
    end,
  })
end

return M
