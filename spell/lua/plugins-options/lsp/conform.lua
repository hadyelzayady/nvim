local M={}
function M.config(_,opts)
	local js_like_formatters = { "biome" }
require("conform").setup({
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
    ["*"] = { "trim_whitespace" },
  },
})
end
return M
