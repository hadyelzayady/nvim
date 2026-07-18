local ok, mod = pcall(require, "dadbod-grip")

if ok and mod.setup then
	mod.setup({
		completion = false
	})
end
