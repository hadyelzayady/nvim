local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

-- Language servers ===========================================================
now_if_args(function()
	add({ "https://github.com/neovim/nvim-lspconfig" })
	vim.lsp.enable({
		"lua_ls",
		"vtsls",
		"biome",
		"cssmodules_ls",
		"css_variables",
		"somesass_ls",
		"cssls",
	})
end)

-- Formatting =================================================================
later(function()
	add({ "https://github.com/nvim-lua/plenary.nvim" })
	add({ "https://github.com/stevearc/conform.nvim" })
	require("conform").setup(require("plugin-options.conform").opts)
end)

-- Snippets ===================================================================

-- Although 'mini.snippets' provides functionality to manage snippet files, it
-- deliberately doesn't come with those.
--
-- The 'rafamadriz/friendly-snippets' is currently the largest collection of
-- snippet files. They are organized in 'snippets/' directory (mostly) per language.
-- 'mini.snippets' is designed to work with it as seamlessly as possible.
-- See `:h MiniSnippets.gen_loader.from_lang()`.
later(function()
	add({ "https://github.com/rafamadriz/friendly-snippets" })
end)
later(function()
	vim.pack.add({ "https://github.com/dmtrKovalenko/fff.nvim" })

	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(event)
			if event.data.updated then
				require("fff.download").download_or_build_binary()
			end
		end,
	})
	-- the plugin will automatically lazy load
	vim.g.fff = {
		lazy_sync = true, -- start syncing only when the picker is open
		debug = {
			enabled = false,
			show_scores = false,
		},
	}
end)

later(function()
	vim.pack.add({ "https://github.com/chrishrb/gx.nvim" })
	require("gx").setup({
		handlers = {
			github = true, -- open github issues
			brewfile = false, -- open Homebrew formulaes and casks
			package_json = true, -- open dependencies from package.json
			search = true, -- search the web/selection on the web if nothing else is found
		},
		handler_options = {
			search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
		},
	})
end)
