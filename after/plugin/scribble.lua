local ok, mod = pcall(require, "scribble")

if ok and mod.setup then
	mod.setup({
		-- your configuration here
	})
end
