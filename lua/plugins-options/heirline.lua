local M = {}
function M.config()
  local heirline = require('heirline')
  local conditions = require('heirline.conditions')
  local utils = require('heirline.utils')
  local colors = {
    red = "#e86671",
    green = "#a8cc8c",
    blue = "#61afef",
    yellow = "#e5c07b",
    magenta = "#d55fde",
    cyan = "#56b6c2",
    fg = "#abb2bf",
    bg = "#282c34",
  }
  -- Define the LSP component
  local LSP = {
    condition = conditions.lsp_attached,
    provider = function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients > 0 then
        return string.format("  LSP[%s]", #clients)
      end
      return ""
    end,
    hl = { fg = colors.cyan, bg = colors.bg },
  }

  -- Define the Git component
  local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
    end,
    provider = function(self)
      local git_info = self.status_dict
      if git_info then
        return string.format("  %s ", git_info.head)
      end
      return ""
    end,
    hl = { fg = colors.yellow, bg = colors.bg },
  }
  -- Set up the statusline
  heirline.setup({
    statusline = {
      Git,
      -- Align the rest to the right
      { provider = "%=" },
     LSP,
    }
    -- Left section: Mode, Git, LSP
  })
end

return M
