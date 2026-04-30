Config.new_autocmd("FileType", { "markdown" }, function(args)
	if vim.fn.exists("b:render_markdown_loaded") == 0 then
		vim.b.render_markdown_loaded = 1
		require("render-markdown").setup({})
	end
end, "Lazy load render-markdown")
