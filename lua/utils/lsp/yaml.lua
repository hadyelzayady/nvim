local M = {}
local function build_query_string(currentIndex, paths_list)
	local key = paths_list[currentIndex]
	if key == nil then
		return ""
	end
	if currentIndex == #paths_list then
		return string.format(
			[[
  (block_node(block_mapping(block_mapping_pair
      key: (flow_node) @%s (#eq? @%s "%s")
      )))
  ]],
			"v" .. tostring(currentIndex),
			"v" .. tostring(currentIndex),
			key
		)
	end
	return string.format(
		[[
  (block_node(block_mapping(block_mapping_pair
      key: (flow_node) @%s (#eq? @%s "%s")
      value: (%s))))
  ]],
		"v" .. currentIndex,
		"v" .. currentIndex,
		key,
		build_query_string(currentIndex + 1, paths_list)
	)
end

function M.yaml_goto_definition()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
	if node == nil then
		error("No TreeSitter parser found")
	end
	local master_node = node:parent():parent()
	local key_node = master_node:child(0)
	local key_node_text = vim.treesitter.get_node_text(key_node, 0)
	if key_node_text ~= "$ref" then
		return
	end
	local value_node = master_node:child(2)
	if value_node == nil then
		return
	end
	local node_text = vim.treesitter.get_node_text(value_node, 0)
	local value_node_text = node_text:match("['|\"](.*)['\"]")
	if not value_node_text:starts("#") then
		vim.cmd("normal! gf")

		return
	end
	local node_local_path = value_node_text:match("#/(.*)")
	local node_local_path_list = node_local_path:split("/")
	local query_string = build_query_string(1, node_local_path_list)
	local query = vim.treesitter.query.parse("yaml", query_string)
	local language_tree = vim.treesitter.get_parser(0, "yaml")
	local syntax_tree = language_tree:parse()
	local root = syntax_tree[1]:root()

	for id, node, metadata in query:iter_captures(root, 0) do
		ts_utils.goto_node(node)
	end
end

return M
