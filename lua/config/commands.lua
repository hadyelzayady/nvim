vim.api.nvim_create_user_command("DiffBuf", function(args)
	if vim.opt.diff._value ==  false then
		vim.cmd("windo diffthis")
	else
		vim.cmd("windo diffoff")
	end
end, { range = true })
