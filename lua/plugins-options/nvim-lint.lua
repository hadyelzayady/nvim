local M = {}
local pattern = [[%s*(%d+):(%d+)%s+(%w+)%s+(.+%S)%s+(%S+)]]
local groups = { 'lnum', 'col', 'severity', 'message', 'code' }
local severity_map = {
  ['error'] = vim.diagnostic.severity.ERROR,
  ['warn'] = vim.diagnostic.severity.WARN,
  ['warning'] = vim.diagnostic.severity.WARN,
}

function M.config()
  -- vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  --   callback = function()
  --     require("lint").try_lint()
  --   end,
  -- })
  -- require('lint').linters.biome = {
  --   cmd = 'biome',
  --   stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments. append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
  --   args = {'check' }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
  -- stream = 'stdout', -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
  -- ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  -- env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
  --   -- parser = your_parse_function
  --   parser = require('lint.parser').from_pattern(pattern, groups, severity_map, { ['source'] = 'biome' }),
  -- }
  -- require('lint').linters_by_ft = {
  --   javascript = { 'biome' },
  --   typescript = { 'biome' },
  --   javascriptreact = { 'biome' },
  --   typescriptreact = { 'biome' },
  -- }
end

return M
