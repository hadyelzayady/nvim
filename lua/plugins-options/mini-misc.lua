local M = {}
function M.config()
  require("mini.misc").setup(
  -- No need to copy this inside `setup()`. Will be used automatically.
{
  -- Array of fields to make global (to be used as independent variables)
  make_global = { 'put', 'put_text', 'setup_auto_root','setup_restore_cursor','zoom' },
}
  )
  MiniMisc.setup_auto_root()

end

return M
