local M = {}

function M.on_file_remove(args)
	require("plugins.lsp.rename_file").rename_file({ old_name = args.source, new_name = args.destination })
end
return M
