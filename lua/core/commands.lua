vim.api.nvim_create_user_command("DiffBuf", function(args)
	if vim.opt.diff._value == false then
		vim.cmd("windo diffthis")
	else
		vim.cmd("windo diffoff")
	end
end, { range = true })

local previous_layout = nil
-- Function to open LazyGit in a new Kitty window and maximize it
function OpenLazyGitInKittyMaximizedWindow()
	vim.system({ "kitty", "@", "ls" }, { text = true }, function(output)
		-- local windows = vim.json.decode(output.stdout)
		-- local active_window = nil
		-- for _, window in ipairs(windows) do
		-- 	if window.is_active then
		-- 		active_window = window
		-- 	end
		-- end
		-- if active_window then
		-- 	local active_tab = nil
		-- 	for _, tab in ipairs(active_window.tabs) do
		-- 		if tab.is_active then
		-- 			active_tab = tab
		-- 		end
		-- 	end
		-- 	if active_tab then
		-- 		previous_layout = active_tab.layout
		-- 	end
		-- end
		-- vim.system({ "kitty", "@", "launch", "--type=window", "--cwd=current", "lazygit" })
		-- vim.system({ "kitty", "@", "goto-layout", "stack" })
		-- Run lazygit in the background and listen for exit to return to previous layout

		vim.system(
			{ "kitty", "@", "launch", "--type=overlay", "--cwd=current", "lazygit" },
			{} --[[,function(output2)
			print("return to ", vim.inspect(output2))
			-- Check if lazygit process exited
			if output2.code == 0 then
				if previous_layout then
					vim.system({ "kitty", "@", "goto-layout", previous_layout })
					previous_layout = nil -- Clear after use
				else
					print("No previous layout saved.")
				end
			end
		end]]
		)
	end)
end

function ReturnToPreviousKittyLayout()
	if previous_layout then
		vim.system({ "kitty", "@", "goto-layout", previous_layout })
		previous_layout = nil -- Clear after use
	else
		print("No previous layout saved.")
	end
end

-- Function to open LazyGit in a new Kitty window and maximize it
function OpenGitUIInKittyMaximizedWindow()
	vim.system({ "kitty", "@", "launch", "--type=overlay", "--cwd=current", "gitui" })
	-- vim.system({ "kitty", "@", "goto-layout", "stack" })
end

vim.api.nvim_create_user_command("Lazygit", OpenLazyGitInKittyMaximizedWindow, {})
vim.api.nvim_create_user_command("Gitui", OpenGitUIInKittyMaximizedWindow, {})
