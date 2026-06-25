-- Config.new_autocmd("FileType", { "markdown" }, function(args)
-- 	if vim.fn.exists("b:render_markdown_loaded") == 0 then
-- 		vim.b.render_markdown_loaded = 1
-- 		require("render-markdown").setup({
-- 			file_types = { "markdown", "codecompanion" },
-- 		})
-- 	end
-- end, "Lazy load render-markdown")

require("render-markdown").setup({
	file_types = { "markdown", "codecompanion" },
})
