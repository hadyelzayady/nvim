local M = {}

function M.config()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
    }
  })
end

return M
