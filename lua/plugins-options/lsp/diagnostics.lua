local M = {}

function M.setup()
	vim.diagnostic.config({
		underline = true,
		update_in_insert = true,
		virtual_text = {
			spacing = 4,
			prefix = "●",
		},
		severity_sort = true,
	})
end
return M
