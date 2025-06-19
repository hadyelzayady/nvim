-- Check file size if a file is passed on the command line
local args = vim.fn.argv()
if #args > 0 then
	local file = args[1]
	local stat = vim.loop.fs_stat(file)
	if stat and stat.size > 100 * 1024 * 1024 then -- 100MB
		print("Large file mode: performance features disabled")
		dofile(vim.fn.stdpath("config") .. "/init.largefile.lua")
		return
	end
end

-- Load normal config if not already loaded
if not vim.g.did_load_normal_config then
	vim.g.did_load_normal_config = true
	dofile(vim.fn.stdpath("config") .. "/init.normal.lua")
end
