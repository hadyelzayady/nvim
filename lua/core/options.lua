-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.splitbelow = true         -- Horizontal splits will be below
vim.opt.splitright = true         -- Vertical splits will be to the right
vim.opt.signcolumn = "yes:1"   -- Always show sign column (otherwise it will shift text)

-- jumps
vim.opt.jumpoptions = "stack,view"

-- performance optimize
vim.opt.updatetime = 300                                  -- Default is 4000ms
vim.opt.ttyfast = true                                    -- Optimize for fast terminals
vim.opt.lazyredraw = true                                 -- Redraw only when necessary

-- general options
vim.o.completeopt = "menu,menuone,noselect,noinsert,popup,fuzzy" -- modern completion menu

vim.o.foldenable = true -- enable fold
vim.o.foldlevel = 99 -- start editing with all folds opened
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr" -- use tree-sitter for folding method
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = "0" -- '0' is not bad

-- NOTE: Setting vim options can be opinionated.
-- While options above are crucial to make this whole config work as expected,
-- below are just list of options I think most users will satisfy.
-- Feel free to modify as your preference.

vim.o.hlsearch = true -- Disable highlight on search
vim.o.termguicolors = true -- enable rgb colors

vim.o.cursorline = true -- enable cursor line
vim.o.cursorcolumn = false
vim.o.cursorlineopt = "line"

vim.o.number = true -- enable line number
vim.o.relativenumber = false -- and relative line number

vim.o.pumheight = 10 -- max height of completion menu

vim.o.list = true -- use special characters to represent things like tabs or trailing spaces
vim.opt.listchars = { -- NOTE: using `vim.opt` instead of `vim.o` to pass rich object
	tab = "▏ ",
	trail = "·",
	extends = "»",
	precedes = "«",
	-- leadmultispace="...|"
}

vim.opt.diffopt:append("linematch:60") -- second stage diff to align lines

vim.o.confirm = true -- show dialog for unsaved file(s) before quit
vim.o.updatetime = 200 -- save swap file with 200ms debouncing

vim.o.ignorecase = true -- case-insensitive search
vim.o.smartcase = true -- , until search pattern contains upper case characters

vim.o.smartindent = true -- auto-indenting when starting a new line
vim.o.shiftround = true -- round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 0 -- 0 to follow the 'tabstop' value
vim.o.tabstop = 4 -- tab width

vim.o.undofile = true -- enable persistent undo
vim.o.undolevels = 10000 -- 10x more undo levels

-- status
vim.o.pumheight = 10        -- Limit popup menu height
vim.o.laststatus = 3
vim.o.showmode = false                              -- Don't show mode, it's redundant with a statusline

-- performance optimize
vim.o.updatetime = 300                                  -- Default is 4000ms
vim.o.ttyfast = true                                    -- Optimize for fast terminals
vim.o.lazyredraw = true                                 -- Redraw only when necessary
