-- Core editor options for Neovim v0.12+
-- Uses latest builtin features

local opt = vim.opt
local g = vim.g
local o = vim.o

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

opt.switchbuf = "usetab" -- Use already opened buffers when switching

opt.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)
--=============== UI Options ===============
opt.shortmess:append("IcFWacnrtTO")
opt.cmdheight = 1
opt.conceallevel = 2
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.jumpoptions = "stack,view"
opt.wrap = true
opt.linebreak = true
opt.showbreak = "↪ "
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true
opt.list = true
opt.winborder = "single"
opt.listchars = {
	tab = "▏ ",
	trail = "·",
	extends = "»",
	precedes = "«",
}

-- Native filetype detection (v0.11+)
g.did_load_filetypes = false
opt.filetype = "on"
opt.syntax = "off"

--=============== Folding (Native Treesitter) ===============
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "1"

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

--=============== Clipboard & Undo ===============
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

--=============== Performance (v0.12+) ===============
opt.updatetime = 200
opt.timeoutlen = 300
opt.lazyredraw = true
opt.redrawtime = 1000
opt.synmaxcol = 240
opt.ttyfast = true
--=============== Timeout Settings ===============
-- timeoutlen: handled in options.lua (300)
-- ttimeoutlen: time for keycode timeout (for ESC sequences)
opt.ttimeoutlen = 10

--=============== Search Optimization ===============
-- Add @-@ to isfname for word characters
opt.isfname:append("@-@")

--=============== Debug ===============
opt.debug = ""

-- Native diff options (v0.10+)
opt.diffopt:append("internal")
opt.diffopt:append("linematch:60")
opt.diffopt:append("algorithm:histogram")

--=============== Split/Windows ===============
opt.splitright = true
opt.splitbelow = true
opt.equalalways = false
opt.autochdir = false

--=============== Swap/Backup ===============
opt.swapfile = false
opt.backup = false
opt.writebackup = false

--=============== Statusline/Popup ===============
opt.pumheight = 12
opt.showmode = false

--=============== Session Options ===============
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

--=============== Match Timeout ===============
opt.matchtime = 1
opt.matchpairs = "(:),{:},[:],<:>"

--=============== Virtual Edit ===============
opt.virtualedit = "block"

--=============== Complete Options ===============
opt.completeopt = { "menu", "menuone", "noselect" }

--=============== Wild Menu ===============
opt.wildmode = { "longest:full", "full" }
opt.wildoptions = { "pum", "tagfile" }

--=============== Spell ===============
opt.spelllang = "en_us"

--=============== File Encoding ===============
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Native formatoptions (v0.12+)
opt.formatoptions = "qj"

--=============== ColorScheme ===============
vim.cmd.colorscheme("habamax")

-- Performance tuning for Neovim v0.12+
-- Timeout for keycode sequences (ESC)
vim.opt.ttimeoutlen = 10

-- Add @-@ to isfname for word characters
vim.opt.isfname:append("@-@")

local f = function()
	vim.cmd("setlocal formatoptions-=c formatoptions-=o")
end
Config.new_autocmd("FileType", nil, f, "Proper 'formatoptions'")
