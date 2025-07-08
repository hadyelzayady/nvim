local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")
local parsers = require("nvim-treesitter.parsers")
local api = vim.api

local default_match_types = {
	"function_declaration",
	"method_declaration",
	"class_declaration",
	"interface_declaration",
	"constructor_declaration",
	"arrow_function",
	"jsx_element",
	"jsx_self_closing_element",
}

local function get_node_text(node)
	return node and vim.treesitter.get_node_text(node, 0) or ""
end

-- Language-specific handlers
local handlers = {
	json = function(node)
		if node:type() == "pair" then
			return get_node_text(node:field("key")[1])
		end
	end,

	default = function(node)
		local type = node:type()
		local name_node

		if type == "jsx_element" or type == "jsx_self_closing_element" then
			name_node = node:field("open_tag")[1]
			if name_node then
				for child in name_node:iter_children() do
					if child:type() == "identifier" or child:type() == "jsx_identifier" then
						name_node = child
						break
					end
				end
			end
		elseif type == "arrow_function" then
			node = node:parent()
		end

		if vim.tbl_contains(default_match_types, type) then
			name_node = name_node or node:field("name")[1]
		end

		return get_node_text(name_node)
	end,
}

function M.context()
	if not parsers.has_parser() then
		return ""
	end

	local node = ts_utils.get_node_at_cursor()
	if not node then
		return ""
	end

	local context = {}
	local handler = handlers[vim.bo.filetype] or handlers.default

	repeat
		local text = handler(node)
		if text and text ~= "" then
			table.insert(context, 1, text)
		end
		node = node:parent()
	until not node

	return #context > 0 and (" " .. table.concat(context, " -> ")) or ""
end

return M
