vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		-- vim.notify('h', nil, { title = "🪚 java", ft = "lua" })
		-- print("Starting Java LSP setup...")
		-- require("lsp.servers.java").setup()
	end,
})
