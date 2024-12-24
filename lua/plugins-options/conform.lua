local M = {}
function M.config(_, opts)
  local js_like_formatters = { "biome", "prettierd" }
  require("conform").setup({
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- Use a sub-list to run only the first available formatter
      javascript = js_like_formatters,
      javascriptreact = js_like_formatters,
      typescript = js_like_formatters,
      typescriptreact = js_like_formatters,
      json = js_like_formatters,
      jsonc = js_like_formatters,
      scss = { "prettierd" },
      css = { "biome", "prettierd" },
      html = { "prettierd" },

      cpp = { "clang_format" },
      sh = { "shfmt" },
      proto = { "buf" },
      toml = { "taplo" },
      nginx = { "nginxfmt" },

      ["_"] = { "trim_whitespace" },
    },
    formatters = {
      biome = {
        condition = function()
          local plenary = require("plenary")
          local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.json")
          local biome_path2 = plenary.path:new(vim.loop.cwd() .. "/biome.jsonc")
          return biome_path:exists() or biome_path2:exists()
        end,
      },
      prettierd = {
        condition = function()
          local plenary = require("plenary")
          local biome_path = plenary.path:new(vim.loop.cwd() .. "/biome.json")
          local biome_path2 = plenary.path:new(vim.loop.cwd() .. "/biome.jsonc")
          return not biome_path:exists() and not biome_path2:exists()
        end,
      },
    },
  })
end

function M.get_buffer_active_formatter()
  local bufnr = vim.api.nvim_get_current_buf()
  -- local buffer_formatters, lspfallback = require("conform").list_formatters_to_run(bufnr)
  local active_formatters = {}
  -- for _, formatter in pairs(buffer_formatters) do
  -- 	table.insert(active_formatters, formatter.name)
  -- end
  -- if #active_formatters == 0 and lspfallback then
  -- 	return { "lsp" }
  -- end
  return active_formatters
end

return M
