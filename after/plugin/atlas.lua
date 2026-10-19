local ok, mod = pcall(require, "atlas")

if ok and mod.setup then
	mod.setup({})
end
