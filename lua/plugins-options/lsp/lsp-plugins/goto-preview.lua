local M={}
function M.config(_,opts)
  require('goto-preview').setup {}
  require("config.keymaps").goto_preview_setup()
end
return M
