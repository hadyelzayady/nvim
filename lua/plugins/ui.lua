return {
	{
		"dhruvasagar/vim-zoom",
	},
	{
		"xiantang/darcula-dark.nvim",
		priority = 1000,
		enabled = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.cmd([[colorscheme darcula-dark]])
		end,
	},
	-- Install without configuration
	{ "projekt0n/github-nvim-theme" },
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	{ "briones-gabriel/darcula-solid.nvim", dependencies = "rktjmp/lush.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({

				dim_inactive = true, -- dims inactive windows
				on_colors = function(colors)
					colors.border = "#565f89"
					colors.bg_visual = "#53003c"
				end,
			})
			vim.cmd([[colorscheme tokyonight-night]])
			-- vim.cmd("hi DiffAdd guifg=#26ac3c guibg=#303030 gui=reverse cterm=reverse")
			-- vim.cmd("hi DiffChange guifg=#2b97b4 guibg=#303030 gui=reverse cterm=reverse")
			-- vim.cmd("hi DiffDelete guifg=#c94300 guibg=#303030 gui=reverse cterm=reverse")
			-- vim.cmd("hi DiffText guifg=#e99200 guibg=#303030 gui=reverse cterm=reverse")
		end,
	},

	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		config = require("plugins-options.catppuccin").config,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = require("plugins-options.kanagawa").config,
		priority = 1000,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = require("plugins-options.dressing").config,
	},
	{
		"uga-rosa/ccc.nvim",
		config = require("plugins-options.ccc").config,
		cmd = { "CccConvert", "CccPick", "CccHighlighterToggle" },
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = require("plugins-options.hlslens").config,
	},
	{
		"3rd/image.nvim",
		enabled = false,
		config = require("plugins-options.image").config,
	},
	{

		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		config = require("plugins-options.mini-indentscope").config,
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
		event = "VeryLazy",
		opts = {
			-- INFO: Uncomment to use treeitter as fold provider, otherwise nvim lsp is used
			-- provider_selector = function(bufnr, filetype, buftype)
			--   return { "treesitter", "indent" }
			-- end,
			open_fold_hl_timeout = 400,
			close_fold_kinds_for_ft = {
				default = { "imports", "comment" },
				json = { "array" },
				java = { "import" },
			},
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					-- winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},
		},
		init = function()
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
		config = function(_, opts)
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local totalLines = vim.api.nvim_buf_line_count(0)
				local foldedLines = endLnum - lnum
				local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
				suffix = (" "):rep(rAlignAppndx) .. suffix
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end
			opts["fold_virt_text_handler"] = handler
			require("ufo").setup(opts)
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					require("plugins.lsp.operations").hover()
				end
			end)
		end,
	},
}
