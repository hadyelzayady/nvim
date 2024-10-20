-- :h lsp-defaults
--
-- NORMAL MODE
-- K        : hover
-- grn      : rename
-- gra      : code action
-- grr      : references
-- CTRL-]   : definition
-- CTRL-W_] : definition in new window
-- CTRL-W_} : definition in preview window
--
-- VISUAL MODE
-- gq : format
--
-- INSERT MODE
-- CTRL-S        : signature help
-- CTRL-X_CTRL-O : completion

---server configurations copied from <https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md>
---@type table<string, vim.lsp.ClientConfig>
local servers = {
  lua_ls = {
    name = "lua-language-server",
    cmd = { "lua-language-server" },
    root_dir = vim.fs.root(0,
      { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }),
    filetypes = { "lua" },
    on_init = require("utils.lsp.lua").lua_ls_on_init,
  },
  tsserver = {
    name = "typescript-language-server",
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json", ".git" }),
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim",
    },
  },
  gopls = {
    name = "gopls",
    cmd = { "gopls" },
    root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
  },
  rust_analyzer = {
    name = "rust_analyzer",
    cmd = { "rust-analyzer" },
    root_dir = vim.fs.root(0, { "Cargo.toml", "rust-project.json" }),
    filetypes = { "rust" },
  },
}
local group = vim.api.nvim_create_augroup("UserLspStart", { clear = true })
for _, config in pairs(servers) do
  if vim.fn.executable(config.cmd[1]) ~= 0 then
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = config.filetypes,
      callback = function(ev)
        vim.lsp.start(config, { bufnr = ev.buf })
      end,
    })
  end
end
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = false }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    client.server_capabilities.documentHighlightProvider = false
    -- Function to set up LSP keymaps for each buffer
    -- Helper function to map keys
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(ev.buf, ...) end
    local opts = { noremap = true, silent = true }

    -- Mappings.
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)          -- Go to definition
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)         -- Go to declaration
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)      -- Go to implementation
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)          -- Find references
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)                -- Hover documentation
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)   -- Signature help
    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)      -- Rename symbol
    buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Code action
    -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- Show diagnostics
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)        -- Go to previous diagnostic
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)        -- Go to next diagnostic
  end
})
