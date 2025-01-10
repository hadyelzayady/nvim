require("utils.string")
return {
	{
		"zeioth/heirline-components.nvim",
		-- opts = {
		--   icons = require("base.icons.nerd_font")
		-- }
	},
	{
		"rebelot/heirline.nvim",
		dependencies = { "zeioth/heirline-components.nvim" },
		lazy = false,
		opts = function()
			local utils = require("heirline.utils")
			-- Fetch colors from the TokyoNight theme's highlight groups
			local colors = {
				fg = utils.get_highlight("Normal").fg, -- Default foreground
				bg = utils.get_highlight("Normal").bg, -- Default background
				blue = utils.get_highlight("Function").fg, -- Blue for functions
				red = utils.get_highlight("Error").fg, -- Red for modified indicator
				winbar_bg = utils.get_highlight("StatusLine").bg, -- Use StatusLine background for Winbar
			}
			local lib = require("heirline-components.all")
			-- Setup for the Winbar
			local winbar = {
				{
					-- Condition to show the filename only when the buffer is not empty
					condition = function()
						return vim.api.nvim_buf_get_name(0) ~= ""
					end,
					-- The provider that displays the filename aligned to the right
					{
						provider = function()
							local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
							return filename
						end,

						-- Make the filename stand out
						hl = {
							fg = "#0bfc03", -- Filename in blue
							bg = colors.winbar_bg, -- Distinguishable background for the Winbar
							bold = true, -- Make the text bold for emphasis
						},
					},
					{
						-- Show an icon if the buffer is modified
						provider = function()
							local extra = ""
							if vim.bo.modified then
								extra = extra .. require("utils.ui-components").icons.file.modified
							end
							return " " .. extra
						end,
						hl = {
							fg = colors.red, -- Make the modified icon red
						},
					},
					{
						-- Show an icon if the buffer is modified
						provider = function()
							local extra = ""
							if lib.condition.file_read_only() then
								extra = extra .. require("utils.ui-components").icons.file.readonly
							end

							return " " .. extra
						end,
						hl = {
							-- fg = colors.red, -- Make the modified icon red
						},
					},
				},
				{
					provider = "   ",
				},
				{
					require("heirline-components.all").component.breadcrumbs(),
				},
			}
			return {
				winbar = winbar,

				opts = {
					disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
						local bufname = vim.api.nvim_buf_get_name(0) -- Get the name of the current buffer
						local isDiffview = bufname:starts("diffview")
						if isDiffview then
							return false
						end
						local is_disabled = not require("heirline-components.buffer").is_valid(args.buf)
							or lib.condition.buffer_matches({
								buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
								filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
							}, args.buf)
						return is_disabled
					end,
				},
				-- tabline = { -- UI upper bar
				--   lib.component.tabline_conditional_padding(),
				--   lib.component.tabline_buffers(),
				--   lib.component.fill { hl = { bg = "tabline_bg" } },
				--   lib.component.tabline_tabpages()
				-- },
				-- winbar = { -- UI breadcrumbs bar
				--   init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
				--   fallthrough = false,
				--   -- Winbar for terminal, neotree, and aerial.
				--   {
				--     condition = function() return not lib.condition.is_active() end,
				--     {
				--       lib.component.neotree(),
				--       lib.component.compiler_play(),
				--       lib.component.fill(),
				--       lib.component.compiler_build_type(),
				--       lib.component.compiler_redo(),
				--       lib.component.aerial(),
				--     },
				--   },
				--   -- Regular winbar
				--   {
				--     lib.component.neotree(),
				--     lib.component.compiler_play(),
				--     lib.component.fill(),
				--     lib.component.breadcrumbs(),
				--     lib.component.fill(),
				--     lib.component.compiler_redo(),
				--     lib.component.aerial(),
				--   }
				-- },
				-- statuscolumn = { -- UI left column
				--   init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
				--   lib.component.foldcolumn(),
				--   lib.component.numbercolumn(),
				--   lib.component.signcolumn(),
				-- } or nil,
				statusline = { -- UI statusbar
					hl = { fg = "fg", bg = "bg" },
					lib.component.git_branch(),
					lib.component.git_diff(),
					lib.component.file_info({
						filename = {}, -- if set, displays the filename.
						file_read_only = { -- if set, displays a lock icon if the file is read only.
							padding = { left = 1, right = 1 },
							condition = lib.condition.file_read_only
						},
						filetype = false,
						file_modified = {}, -- if set, displays a white dot if the file has been modified.
					}),
					{
						provider = function()
							local statusline = require("arrow.statusline")
							return statusline.text_for_statusline_with_icons() -- Same, but with an bow and arrow icon ;D
						end,
					},
					lib.component.diagnostics(),
					lib.component.fill(),
					lib.component.cmd_info(),
					lib.component.fill(),
					{
						provider = function()
							local active = require("conform").list_formatters_to_run()
							local ui = ""
							for _, value in ipairs(active) do
								if value.available then
									if string.len(ui) == 0 then
										ui = value.name
									else
										ui = ui .. "," .. value.name
									end
								end
							end
							return require("utils.ui-components").icons.format.formatter .. " [" .. ui .. "] "
							-- local statusline = require("arrow.statusline")
							-- return statusline.text_for_statusline_with_icons() -- Same, but with an bow and arrow icon ;D
						end,

					},
					lib.component.lsp({ lsp_client_names = { integrations = { conform = false } } }),
					lib.component.file_info(),
					lib.component.compiler_state(),
					lib.component.nav(),
				},
			}
		end,
		config = function(_, opts)
			local heirline = require("heirline")
			local heirline_components = require("heirline-components.all")

			-- Setup
			heirline_components.init.subscribe_to_events()
			heirline.load_colors(heirline_components.hl.get_colors())
			heirline.setup(opts)
		end,
	},
}
