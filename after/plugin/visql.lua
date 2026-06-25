local ok, mod = pcall(require, "vi-sql")

if ok and mod.setup then
	mod.setup({})
end
