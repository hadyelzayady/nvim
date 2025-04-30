vim.o.winbar = "%{%v:lua.FilePath()%} %r%m %{%v:lua.TsContext()%}"

function FilePath()
	local filename = vim.fn.expand("%:f")
	local modified = vim.bo.modified

	if modified then
		return "%#@comment.warning#" .. filename .. "%*"
	else
		return filename
	end
end

function TsContext()
	return require("utils.winbar.context").context()
end
