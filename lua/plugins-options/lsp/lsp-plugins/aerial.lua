local M={}
function M.config(_,opts)
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  -- Call the setup function to change the default behavior
  require("aerial").setup()

  end
  return M
