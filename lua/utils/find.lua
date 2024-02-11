local M = {}

local FilesPicker = {}
FilesPicker.toggle = function(_, opts)
	FilesPicker.pick(opts)
end
FilesPicker.pick = function(opts)
	opts = opts or {}
	opts.debug = false
	opts.cmd = opts.cmd or "fd --color=never --type f --hidden --follow --no-ignore"
	opts.actions = {
		["ctrl-g"] = FilesPicker.toggle,
	}
	if opts.cmd:match("%s+%-%-no%-ignore$") then
		opts.cmd = opts.cmd:gsub("%s+%-%-no%-ignore$", "")
	else
		opts.cmd = opts.cmd .. " --no-ignore"
	end

	require("fzf-lua").files(opts)
end
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
	require("fzf-lua").fzf_exec("ls", {
		actions = {
			["ctrl-x"] = {
				function(selected)
					-- uncomment to enable deletion
					-- vim.fn.delete(selected[1])
				end,
				require("fzf-lua").actions.resume,
			},
		},
	})
end

return M
