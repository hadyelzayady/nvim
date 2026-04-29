local opt = vim.opt
local g = vim.g

--=============== Disable Legacy Providers ===============
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0

-- Disable legacy features that slow down Neovim
for _, plugin in ipairs({
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"matchparen",
	"2html_plugin",
	"shada_plugin",
	"tutor_mode_plugin",
	"logiPat",
	"rrhelper",
	"rplugin",
	"remote_plugins",
}) do
	g["loaded_" .. plugin] = 1
end

--=============== UI Options ===============
opt.number = true
opt.relativenumber = false
opt.wrap = true
opt.linebreak = true
opt.showbreak = "↪ "
opt.winborder = "rounded" -- use rouned border for all floating windows
opt.cursorlineopt = "both" -- v0.12+
opt.pumborder = "single" -- Use border in popup menu
opt.pumheight = 10 -- Make popup menu smaller
opt.pummaxwidth = 100 -- Make popup menu not too wide
opt.shortmess = "CFOSWaco" -- Disable some built-in completion messages
opt.signcolumn = "yes" -- Always show sign column to prevent shifting

-- Native filetype detection (v0.11+)
g.did_load_filetypes = false
opt.filetype = "on"
opt.syntax = "off"

--=============== Editing ===============
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.mouse = "a"
opt.confirm = true

--=================   Split/Windows ========================
opt.splitright = true -- New vertical split opens to the right
opt.splitbelow = true -- New horizontal split opens below
opt.equalalways = false -- Prevent auto-resizing of splits

--============= Fold================
opt.foldenable = false -- enable fold
opt.foldlevel = 99 -- start editing with all folds opened
opt.foldlevelstart = 99

--=============== Clipboard & Undo ===============
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
	},
	signs = false,
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

require("vim._core.ui2").enable()
