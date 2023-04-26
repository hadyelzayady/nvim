local M = {}

function M.find_project_files()
  vim.cmd("FzfLua files")
  -- require "telescope.builtin".git_files({ show_untracked = true })
  -- local optss = { show_untracked = true } -- define here if you want to define something
  -- vim.fn.system('git rev-parse --is-inside-work-tree')
  -- if vim.v.shell_error == 0 then
  --   require "telescope.builtin".git_files(optss)
  -- else
  --   require "telescope.builtin".find_files(optss)
  -- end
end

function M.temp()
  require 'fzf-lua'.fzf_exec("ls", {
      actions = {
          ['ctrl-x'] = {
              function(selected)
                print("deleting:", selected[1])
                -- uncomment to enable deletion
                -- vim.fn.delete(selected[1])
              end,
              require 'fzf-lua'.actions.resume
          }
      }
  })
end

return M
