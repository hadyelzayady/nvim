local ok, mod = pcall(require, "onoma")

if ok and mod.setup then
	mod.setup({
		picker = { "snacks" },
	})
end
