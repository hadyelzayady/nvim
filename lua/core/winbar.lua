local ts = require("nvim-treesitter")

vim.o.winbar = "%f %r%m %{%v:lua.Winbar()%}"
-- Define abbreviations for Treesitter patterns
local pattern_abbreviations = {
	["function"] = "f",
	["class"] = "C",
	["method"] = "m",
	["variable"] = "v",
	["parameter"] = "p",
	["property"] = "P",
	["module"] = "M",
	["interface"] = "I",
	["struct"] = "S",
}

-- Function to abbreviate Treesitter statusline output
local function abbreviated_treesitter_statusline(ts_status)
	-- Replace long names with abbreviations
	for long, short in pairs(pattern_abbreviations) do
		ts_status = ts_status:gsub("%f[%a]" .. long .. "%f[%A]", short)
	end

	return ts_status
end
function Winbar()
	local ts_context = ts.statusline({ indicator_size = 100 }) or ""
	if ts_context then
		return " " .. abbreviated_treesitter_statusline(ts_context)
	end
	return ""
end
