vim.api.nvim_create_user_command("DiffBuf", function(args)
  if vim.opt.diff._value == false then
    vim.cmd("windo diffthis")
  else
    vim.cmd("windo diffoff")
  end
end, { range = true })

-- Function to open LazyGit in a new Kitty window and maximize it
function OpenLazyGitInKittyMaximizedWindow()
  -- Command to open a new window in Kitty with LazyGit
  os.execute("kitty @ launch --type=tab --cwd=current lazygit")
end
-- Function to open LazyGit in a new Kitty window and maximize it
function OpenGitUIInKittyMaximizedWindow()
  -- Command to open a new window in Kitty with LazyGit
  os.execute("kitty @ launch --type=tab --cwd=current gitui")
end

vim.api.nvim_create_user_command('Lazygit', OpenLazyGitInKittyMaximizedWindow, {})
vim.api.nvim_create_user_command('Gitui', OpenGitUIInKittyMaximizedWindow, {})
