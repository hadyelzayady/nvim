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
	local ts_utils = require("nvim-treesitter.ts_utils")
	local parsers = require("nvim-treesitter.parsers")
	local api = vim.api

	if not parsers.has_parser() then
		return ""
	end

	local cursor_node = ts_utils.get_node_at_cursor()
	if not cursor_node then
		return ""
	end

	local context = {}
	local function get_node_text(node)
		if vim.treesitter.query ~= nil then
			return vim.treesitter.get_node_text(node, api.nvim_get_current_buf())
		end
		return ""
	end

	while cursor_node do
		local node_type = cursor_node:type()
		local possible_cursor_node = cursor_node
		if node_type == "jsx_element" or node_type == "jsx_self_closing_element" then
			possible_cursor_node = cursor_node:field("open_tag")[1] or cursor_node
		elseif node_type == "arrow_function" then
			possible_cursor_node = cursor_node:parent()
		end

		if
			node_type == "function_declaration"
			or node_type == "method_declaration"
			or node_type == "class_declaration"
			or node_type == "interface_declaration"
			or node_type == "constructor_declaration"
			or node_type == "arrow_function"
			or node_type == "jsx_element"
			or node_type == "jsx_self_closing_element"
		then
			local name_node = possible_cursor_node:field("name")[1]
			if name_node then
				table.insert(context, 1, get_node_text(name_node))
			end
		end
		cursor_node = cursor_node:parent()
	end

	if #context == 0 then
		return ""
	end
	return " " .. table.concat(context, " -> ")
end
