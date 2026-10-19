local ok, mod = pcall(require, "tsc")

if ok and mod.setup then
	mod.setup({
		-- your configuration here
	})
end
