local ok, mod = pcall(require, "kulala")

if ok and mod.setup then
	mod.setup({
		global_keymaps = true,
	})
end
