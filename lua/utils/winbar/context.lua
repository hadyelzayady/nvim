local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")
local parsers = require("nvim-treesitter.parsers")
local api = vim.api

local function get_node_text(node)
	if vim.treesitter.query ~= nil then
		return vim.treesitter.get_node_text(node, api.nvim_get_current_buf())
	end
	return ""
end

local function programming_lang(cursor_node, context)
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
end

local function json_lang(cursor_node, context)
	local node_type = cursor_node:type()
	local possible_cursor_node = cursor_node

	if node_type == "pair" then
		local name_node = possible_cursor_node:field("key")[1]
		if name_node then
			table.insert(context, 1, get_node_text(name_node))
		end
	end
end

function M.context()
	if not parsers.has_parser() then
		return ""
	end

	local cursor_node = ts_utils.get_node_at_cursor()
	if not cursor_node then
		return ""
	end

	local context = {}
	local handler = vim.bo.filetype == "json" and json_lang or programming_lang

	while cursor_node do
		cursor_node = cursor_node:parent()
		if not cursor_node then
			break
		end
		handler(cursor_node, context)
	end

	if #context == 0 then
		return ""
	end
	return " " .. table.concat(context, " -> ")
end
return M
