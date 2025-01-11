local lsp_specific = {}
lsp_specific.jdtls = {
	remove_unused_imports = "source.organizeImports",
	add_missing_imports = "source.addMissingImports",
}
lsp_specific.biome = {
	fix_all = "source.fixAll",
}

local M = {}
M.source_action_kinds = {
	organize_imports = "source.organizeImports",
	sort_imports = "source.sortImports",
	remove_unused_imports = "source.removeUnusedImports",
	fix_all = "source.fixAll.ts",
	remove_unused = "source.removeUnused.ts",
	add_missing_imports = "source.addMissingImports.ts",
}

function M.get_client_action(clientName, action)
	if lsp_specific[clientName] ~= nil and lsp_specific[clientName][action] ~= nil then
		return lsp_specific[clientName][action]
	end
	return M.source_action_kinds[action]
end
return M
