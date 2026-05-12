vim.o.completeopt = "menuone,preselect,fuzzy,nosort" -- Use custom behavior
vim.pack.add({
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/mikavilpas/blink-ripgrep.nvim" },
	{ src = "https://github.com/Kaiser-Yang/blink-cmp-git" },
	{ src = "https://github.com/alexandre-abrioux/blink-cmp-npm.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("blink.cmp")
			end
			require("blink.cmp").build():wait(60000)
		end
	end,
})
