local M = {}
function M.config()
  require("dressing").setup({
    input = {
      enabled = true,
    },
    select = {
      enabled = false,
    }
  })
end

return M
