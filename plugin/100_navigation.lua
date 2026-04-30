vim.pack.add({
	{ src = "https://github.com/stevearc/aerial.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/A7Lavinraj/fyler.nvim" },
	{ src = "https://github.com/chrishrb/gx.nvim" },
	{ src = "https://github.com/dmtrKovalenko/fff.nvim" },
	{ src = "https://github.com/echasnovski/mini.bufremove" },
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "fff.nvim" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("fff.nvim")
			end
			require("fff.download").download_or_build_binary()
		else
			if name == "fzf" and (kind == "install" or kind == "update") then
				vim.fn["fzf#install"]()
			end
		end
	end,
})
