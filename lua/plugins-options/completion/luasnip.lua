local M = {}

function M.config()
  local ls = require("luasnip")
  ls.setup()

  local snippets_folder = vim.fn.stdpath("config") .. "/lua/plugins-options/completion/snippets/"
  require("luasnip.loaders.from_lua").lazy_load({ paths = snippets_folder })

  vim.api.nvim_create_user_command("LuaSnipEdit", function()
    require("luasnip.loaders.from_lua").edit_snippet_files()
  end, {})
  -- vim.keymap.set({ "i" }, "<C-K>", function()
  --   ls.expand()
  -- end, { silent = true })
  -- vim.keymap.set({ "i", "s" }, "<C-L>", function()
  --   ls.jump(1)
  -- end, { silent = true })
  -- vim.keymap.set({ "i", "s" }, "<C-J>", function()
  --   ls.jump(-1)
  -- end, { silent = true })
  --
  -- vim.keymap.set({ "i", "s" }, "<C-E>", function()
  --   if ls.choice_active() then
  --     ls.change_choice(1)
  --   end
  -- end, { silent = true })
end

return M
