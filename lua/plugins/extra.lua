return {
	{
		"folke/which-key.nvim",
		opts = require("plugins.config.whichkey").opts,
		event = "VeryLazy",
		cond = function()
			return vim.o.columns > 80 -- skip for small windows
		end,
	},
	{
		"chrisgrieser/nvim-chainsaw",
		keys = { "<space>," },
		opts = {},
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		enabled = true,
		opts = require("plugins.config.autosession").opts,
	},
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		opts = require("plugins.config.package-info").opts,
		lazy = true,
	},
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		cmd = { "LivePreview" },
	},
	{
		"jrop/tuis.nvim",
		config = function()
			-- Optional: set up keymaps
			vim.keymap.set("n", "<leader>m", function()
				require("tuis").choose()
			end, { desc = "Choose Morph UI" })
		end,
	},
	{ "joryeugene/dadbod-grip.nvim", version = "*" },
	{
		"jugarpeupv/aws.nvim",
		dependencies = {
			"stevearc/oil.nvim",
			config = function()
				require("oil").setup()
			end,
		},
		config = function()
			require("aws").setup()
		end,
	},
	{
		"minigian/juan-logs.nvim",
		build = function(plugin)
			local path = plugin.dir .. "/build.lua"
			if vim.fn.filereadable(path) == 1 then
				dofile(path)
			end
		end,
		-- You can use `build = "cargo build --release"` if you have `cargo` in your system
		config = function()
			require("juanlog").setup({
				threshold_size = 1024 * 1024 * 100, -- 100MB trigger
				mode = "dynamic", -- I don't remember the other mode name, but it's useless so don't worry
				lazy = true, -- background indexing. prevents neovim from freezing
				dynamic_chunk_size = 10000, -- lines to load at once
				dynamic_margin = 2000, -- trigger scroll load when this close to the edge
				patterns = { "*.log", "*.txt", "*.csv", "*.json","*.sql" },
				enable_custom_statuscol = true, -- fakes absolute line numbers
				syntax = false, -- set to true to enable native vim syntax (can be slow)
			})
		end,
	},
}
