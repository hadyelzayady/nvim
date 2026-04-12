vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.icons" },
})
--======================== Mini Icons =================================
-- Set up to not prefer extension-based icon for some extensions
local ext3_blocklist = { scm = true, txt = true, yml = true }
local ext4_blocklist = { json = true, yaml = true }
require("mini.icons").setup({
	use_file_extension = function(ext, _)
		return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
	end,
})

-- Mock 'nvim-tree/nvim-web-devicons' for plugins without 'mini.icons' support.
-- Not needed for 'mini.nvim' or MiniMax, but might be useful for others.
MiniIcons.mock_nvim_web_devicons()

-- Add LSP kind icons. Useful for 'mini.completion'.
MiniIcons.tweak_lsp_kind()

-- Native UI configuration for Neovim v0.12+
-- Uses latest built-in UI features

local opt = vim.opt

--=============== Native Winbar (v0.12+) ===============
opt.winbar = "%f %=%m %y"

-- Native statusline (v0.12+)
opt.laststatus = 3 -- Global statusline

--=============== UI Highlights ===============
-- Native theme colors (v0.12+)
vim.cmd([[
  " Link groups to base highlights
  highlight! link @keyword Keyword
  highlight! link @function Function
  highlight! link @variable Special
  highlight! link @type Type
  highlight! link @string String
  highlight! link @comment Comment
  highlight! link @constant Constant
  highlight! link @punctuation Delimiter

  " Diagnostic highlights
  highlight! link DiagnosticError Error
  highlight! link DiagnosticWarn Warning
  highlight! link DiagnosticInfo Info
  highlight! link DiagnosticHint Hint

  " Quickfix window
  highlight! link qfFileName Directory
  highlight! link qfLineNr LineNr

  " Sign column
  highlight! link SignColumn LineNr

  " Statusline (native)
  highlight! link StatusLine Normal
  highlight! link StatusLineNC Normal


  " Native popup menu styling (v0.12+)
  highlight Pmenu guibg=#1e1e1e guifg=#d4d4d4
  highlight PmenuSel guibg=#264f78 guifg=#ffffff
  highlight PmenuSbar guibg=#3a3a3a
  highlight PmenuThumb guibg=#686868


  "--=============== Native Notify/UI feedback ===============
  "-- Built-in vim commands for UI feedback
  highlight! link MsgArea Normal
  highlight! link MoreMsg Special

  "--=============== Command Line Completion ===============
  "-- Native wild menu styling (v0.12+)
  highlight WildMenu guibg=#3a3a3a guifg=#ffffff
  highlight Pmenu guibg=#262626 guifg=#d4d4d4

]])

opt.pumborder = "single" -- Use border in popup menu
opt.pumheight = 10 -- Make popup menu smaller
opt.pummaxwidth = 100 -- Make popup menu not too wide
--=============== Tabline (v0.12+) ===============
-- Native tabline configuration
opt.showtabline = 1 -- Show only when multiple tabs

--=============== Diagnostic UI ===============
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
	},
})

-- Cursor settings (native v0.12+)
opt.cursorlineopt = "both" -- v0.12+

--=============== Smooth Scroll ===============
opt.smoothscroll = false -- Enable if using scrollback

--=============== Visual selections ===============
opt.selection = "inclusive"

--=============== Match Timeout ===============
opt.matchtime = 3

--=============== VisualBell (Native) ===============
opt.visualbell = false
opt.errorbells = false

--=============== More options ===============
opt.display = "truncate"
opt.whichwrap = "b,s,h,l,<,>,[,]"
