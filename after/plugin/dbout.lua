local ok, mod = pcall(require, "dbout")

if ok and mod.setup then
	mod.setup({})
end
