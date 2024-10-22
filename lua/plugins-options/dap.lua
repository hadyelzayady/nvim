local M = {}
function M.config()
  local dap = require('dap')
  -- -- Use Mason's registry to get the path to the codelldb executable
  -- local mason_registry = require('mason-registry')
  -- local codelldb = mason_registry.get_package("codelldb")
  --
  -- -- Get the actual path to the codelldb executable
  -- local codelldb_path = codelldb:get_install_path() .. "/extension/adapter/codelldb"
  -- dap.adapters.lldb = {
  --   type = 'server',
  --   port = "${port}",
  --   command = codelldb_path,
  --   name = 'lldb',
  -- }
  --
  -- -- Attach configuration for Rust
  -- dap.configurations.rust = {
  --   {
  --     name = "Attach to Process",
  --     type = "lldb",
  --     request = "attach",
  --     pid = require("dap.utils").pick_process,
  --     args = {},
  --   },
  -- }
end

return M
