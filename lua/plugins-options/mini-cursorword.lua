local M = {}
function M.config()
  require("mini.cursorword").setup( 
  -- No need to copy this inside `setup()`. Will be used automatically.
  {
    -- Delay (in ms) between when cursor moved and when highlighting appeared
    delay = 100,
  })
end

return M