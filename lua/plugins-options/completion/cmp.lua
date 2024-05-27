local M = {}

function M.config()
	local cmp = require("cmp")
	local border = function(hl)
		return {
			{ "╭", hl },
			{ "─", hl },
			{ "╮", hl },
			{ "│", hl },
			{ "╯", hl },
			{ "─", hl },
			{ "╰", hl },
			{ "│", hl },
		}
	end

	local opts = {
		completion = {
			completeopt = "menu,menuone,noinsert",
		},

		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			completion = {
				border = border("Normal"),
				max_width = 80,
				max_height = 20,
			},
			documentation = {
				border = border("CmpDocBorder"),
			},
		},
		mapping = cmp.mapping.preset.insert({
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" }, -- For luasnip users.
			{ name = "calc" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}),
	}

	cmp.setup(opts)

	-- cmp.setup.filetype("gitcommit", {
	-- 	sources = cmp.config.sources({
	-- 		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	-- 	}, {
	-- 		{ name = "buffer" },
	-- 		{ name = "luasnip" },
	-- 	}),
	-- })
	-- cmp.setup.filetype("NeogitCommitMessage", {
	-- 	sources = cmp.config.sources({
	-- 		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	-- 	}, {
	-- 		{ name = "buffer" },
	-- 		{ name = "luasnip" },
	-- 	}),
	-- })
	-- cmp.setup.filetype("sql", {
	-- 	sources = cmp.config.sources({
	-- 		{ name = "vim-dadbod-completion" },
	-- 		{ name = "buffer" },
	-- 		{ name = "luasnip" },
	-- 	}),
	-- })
end

return M
