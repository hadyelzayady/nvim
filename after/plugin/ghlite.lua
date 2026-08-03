local ok, mod = pcall(require, "ghlite")
if ok and mod.setup then
	mod.setup({})
end
