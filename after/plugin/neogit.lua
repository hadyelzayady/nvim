local ok, mod = pcall(require,"neogit")

if ok and mod.setup then
mod.setup({
	kind = "split_below",
	integrations = {
		telescope = false,
		fzf_lua = true,
		mini_pick = false,
		snacks = false,
	},
})
end
