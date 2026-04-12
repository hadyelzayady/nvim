-- Native Treesitter configuration for Neovim v0.9+ (v0.12 optimized)
-- Uses built-in Treesitter API (no external plugin required)

--=============== Native Treesitter Query ===============
local ts_query = vim.treesitter.query

--=============== Treesitter Language List ===============
-- Languages to use (installed via TSInstall or built-in)
local languages = {
  "lua",
  "vim",
  "bash",
  "c",
  "cpp",
  "json",
  "yaml",
  "markdown",
  "python",
  "go",
  "rust",
  "html",
  "css",
  "javascript",
  "typescript",
  "query",
}

--=============== Language Server Setup (Native) ===============
-- Use vim.treesitter.language.add() to enable treesitter for a filetype
-- This is the native v0.10+ way to enable treesitter

local function setup_treesitter()
  -- Enable treesitter for common filetypes
  for _, lang in ipairs(languages) do
    pcall(vim.treesitter.language.add, lang)
  end
end

-- Run setup
setup_treesitter()

--=============== Native Fold ===============
-- Treesitter-based folding is enabled in options.lua via:
-- opt.foldmethod = "expr"
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

--=============== Native Highlight ===============
-- Treesitter syntax highlighting is enabled in options.lua
-- opt.syntax = "on" (instead of "off")

-- Enable treesitter highlight for specific filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "lua", "vim", "bash", "sh", "zsh",
    "python", "json", "yaml", "yml",
    "markdown", "go", "rust", "c", "cpp",
    "html", "css", "javascript", "typescript",
  },
  callback = function(args)
    local ok, _ = pcall(vim.treesitter.start, args.buf, args.match)
    if not ok then
      vim.opt.syntax = "on"
    end
  end,
})

--=============== Treesitter Commands ===============
-- Install parser for current filetype
vim.api.nvim_create_user_command("TSInstall", function(opts)
  local lang = opts.args ~= "" and opts.args or vim.bo.filetype
  vim.cmd("TSInstallSync " .. lang)
end, { nargs = "?" })

-- Enable treesitter highlight for buffer
vim.api.nvim_create_user_command("TSEnable", function()
  local ft = vim.bo.filetype
  vim.treesitter.language.add(ft)
  vim.treesitter.start()
end, {})

-- Disable treesitter highlight
vim.api.nvim_create_user_command("TSDisable", function()
  vim.treesitter.stop()
end, {})
