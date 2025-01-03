local M = {}

M.undodir = vim.fn.expand("~/.undodir")
local function hash_filename(filename)
	local handle = io.popen("echo -n " .. filename .. " | sha256sum | awk '{print $1}'")
	if handle == nil then
		return
	end
	local result = handle:read("*a"):gsub("%s+", ""):gsub("[+/=]", "_")
	handle:close()
	return result
end

-- Function to get the hashed undofile path
local function get_undofile_path()
	local filename = vim.fn.expand("%:p")
	return M.undodir .. "/" .. hash_filename(filename)
end

function M.read_undo()
	local file_path = get_undofile_path()
	if vim.fn.filereadable(file_path) == 1 then
		vim.cmd("rundo " .. file_path)
	end
end

function M.write_undo()
	local dir_name = vim.fn.expand("%:h") .. "/UNDO"
	if vim.fn.isdirectory(M.undodir) == 0 then
		vim.fn.mkdir(dir_name)
	end
	vim.cmd("wundo " .. get_undofile_path())
end
return M
