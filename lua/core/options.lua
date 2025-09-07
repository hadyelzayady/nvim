local opt = vim.opt
local g = vim.g

--=================   Disable Providers ========================
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-- Disable all these legacy plugins/features
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
	vim.g["loaded_" .. plugin] = 1
end

--=================   UI ========================
vim.opt.shortmess:append("IcFW")
vim.opt.cmdheight = 1

opt.conceallevel = 2 -- Hide characters until needed
opt.number = true -- Show line numbers
opt.relativenumber = false -- Relative line numbers (easier for jumping)
opt.cursorline = true -- Highlight the current line
opt.signcolumn = "yes" -- Always show sign column to prevent shifting
opt.jumpoptions = "stack,view"
opt.wrap = true -- Enable line wrapping
opt.linebreak = true -- Wrap at word boundaries
opt.showbreak = "↪ " -- Optional: Indicator for wrapped lines
opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.list = true
opt.winborder = "rounded" -- use rouned border for all floating windows
opt.listchars = {
	tab = "▏ ",
	trail = "·",
	extends = "»",
	precedes = "«",
	-- lead="␣",
	-- leadmultispace="...|"
}

vim.cmd.colorscheme("habamax")
--=================   Fold ========================
opt.foldenable = false -- enable fold
opt.foldlevel = 99 -- start editing with all folds opened
opt.foldlevelstart = 99
opt.foldmethod = "expr" -- use tree-sitter for folding method
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0" -- '0' is not bad

--=================   Editing ========================
opt.smartindent = true -- Auto-indent new lines intelligently
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Indentation width (use 4 spaces)
opt.tabstop = 4 -- Number of spaces per tab
opt.softtabstop = 4 -- Spaces per tab when pressing <Tab>
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- But respect case if search includes uppercase
opt.incsearch = true -- Incremental search
opt.hlsearch = true -- Don't highlight search results after pressing Enter
opt.mouse = "a" -- Enable mouse support in all modes
opt.confirm = true -- show dialog for unsaved file(s) before quit

--=================   Clipboard/Undo ========================
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.undofile = true -- Enable persistent undo
opt.undodir = vim.fn.stdpath("data") .. "/undo" -- Set undo directory

--=================   Performance ========================
opt.updatetime = 250 -- Faster UI updates (default is 4000ms)
opt.timeoutlen = 300 -- Faster leader key timeout
opt.lazyredraw = true -- Avoid unnecessary screen redraws
opt.redrawtime = 1000 -- Increase max redraw time for large files
opt.synmaxcol = 200 -- Limit syntax highlighting for long lines
opt.ttyfast = true -- Enable fast terminal mode
opt.filetype="on"
g.did_load_filetypes = nil -- skip vimscripts for filetype detection
vim.cmd("syntax off") -- Disable syntax highlighting for performance as we use treesitter

--=================   Split/Windows ========================
opt.splitright = true -- New vertical split opens to the right
opt.splitbelow = true -- New horizontal split opens below
opt.equalalways = true -- Prevent auto-resizing of splits

--=================   Backup/Swap ========================
opt.swapfile = true -- Disable swap files
opt.backup = false -- Disable backup files
opt.writebackup = false -- Disable write backup

--=================   Diff ========================
opt.diffopt = {
	"inline:word",
	"internal",
	"indent-heuristic", -- Use heuristic for indenting
	"filler",
	"closeoff",
	"context:12",
	"vertical", -- Show diffs in vertical splits
	"hiddenoff", -- Do not hide buffers when viewing diffs
	"algorithm:histogram", -- Use the histogram algorithm for better diffs
	"linematch:60", -- Align similar lines (Neovim 0.9+ feature)
}

--=================   Statusline ========================
opt.pumheight = 10 -- Limit popup menu height
-- opt.laststatus = 3          -- global statusline
opt.showmode = false -- Don't show mode, it's redundant with a statusline
