return {
	{
		"anuvyklack/hydra.nvim",
		event = { "BufReadPre" },
		config = function(_, _)
			local hydra = require("hydra")
			local menus = require("plugins-options.hydra")
			-- hydra(menus.gitsigns_menu())
			-- hydra(menus.merge_conflict_menu())
			hydra(menus.dap_menu())
			-- hydra(quick_menu())
		end,
	},
}
