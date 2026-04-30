require("auto-session").setup({
	suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	auto_save = false, -- Enables/disables auto saving session on exit
	auto_restore = false, -- Enables/disables auto restoring session on start
	cwd_change_handling = true, -- Automatically save/restore sessions when changing directories
	git_use_branch_name = true,
	git_auto_restore_on_branch_change = true,
	session_lens = {
		picker = "fzf",
	},
})
