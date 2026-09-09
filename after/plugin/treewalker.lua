local ok, mod = pcall(require, "treewalker")

if ok and mod.setup then
	mod.setup({
		-- your configuration here
	})
end
