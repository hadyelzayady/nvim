local ok, mod = pcall(require, "mini.statuscolumn")

if ok and mod.setup then
	mod.setup({})
end
