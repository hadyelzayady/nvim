local M = {}
function M.setup()
	local home = os.getenv("HOME")
	vim.lsp.config("sqls", {
		cmd = { "sqls", "-config", home .. "/.config/sqls/config.yaml" },
	})
end
return M
