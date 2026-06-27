local ok, mod = pcall(require, "mini.input")

if ok and mod.setup then
	mod.setup()
end
