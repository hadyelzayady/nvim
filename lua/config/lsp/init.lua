-- vim.lsp.config("*", {
-- 	capabilities = require("config.lsp.utils").capabilities,
-- })
-- require("config.lsp.lua")
-- require("config.lsp.vtsls")
-- require("config.lsp.biome")
-- require("config.lsp.cssls")
-- require("config.lsp.eslint")
-- require("config.lsp.json")
--
-- vim.lsp.enable({ "luals", "vtsls", "biome" })

vim.api.nvim_create_autocmd("LspNotify", {
	callback = function(args)
		if args.data.method == "textDocument/didOpen" then
			vim.lsp.foldclose("imports", vim.fn.bufwinid(args.buf))
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/foldingRange") then
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
		end
	end,
})
