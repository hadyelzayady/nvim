return function()
  local util = require "formatter.util"
  return {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
      -- Formatter configurations for filetype "lua" go here
      -- and will be executed in order
      lua = {
        require("formatter.filetypes.lua").stylua,
      },
      typescriptreact = {
        require("formatter.filetypes.typescriptreact").prettierd,
      },
      javascriptreact = {
        require("formatter.filetypes.typescriptreact").prettierd,
      },
      javascript = {
        require("formatter.filetypes.typescriptreact").prettierd,
      },
      typescript = {
        require("formatter.filetypes.typescriptreact").prettierd,
      },
      scss = {
        require("formatter.filetypes.typescriptreact").prettierd,
      },

      sh = {
        require("formatter.filetypes.sh").shfmt,
      },

      ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace
      }
    }
  }
end
