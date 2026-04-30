Config.new_autocmd({ "InsertEnter" }, nil, function()
	if vim.fn.exists("g:loaded_mini_pairs") == 0 then
		require("mini.pairs").setup()
		vim.g.loaded_mini_pairs = 1
	end
end, "Lazy load mini-pairs on InsertEnter")
