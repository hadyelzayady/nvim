vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
-- opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- pum is the complettion list of vim command for example when use :set the list will have max of 10 items and scrollable
opt.pumblend = 10 -- Popup blend(transparency)
opt.pumheight = 10 -- Maximum number of entries in a popup

opt.conceallevel = 0 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"
-- opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.laststatus = 0
-- opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.scrolloff = 4 -- Lines of context
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.sidescrolloff = 8 -- Columns of context

opt.expandtab = true -- Use spaces instead of tabs
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for

opt.timeoutlen = 300
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width

opt.spell = true
opt.spelllang = { "en_us" }

-- Appearance
opt.breakindent = true -- Indent wrapped lines to match line start
opt.cursorline = true -- Highlight current line
opt.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.splitbelow = true -- Horizontal splits will be below
opt.splitright = true -- Vertical splits will be to the right
opt.termguicolors = true -- Enable gui colors

opt.ruler = false -- Don't show cursor position in command line
opt.showmode = false -- Don't show mode in command line
opt.wrap = true -- Display long lines as just one line

opt.signcolumn = "yes" -- Always show sign column (otherwise it will shift text)
opt.fillchars = "eob: " -- Don't show `~` outside of buffer

-- Editing
opt.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
opt.incsearch = true -- Show search results while typing
opt.infercase = true -- Infer letter cases for a richer built-in keyword completion
opt.smartcase = true -- Don't ignore case when searching if pattern has upper case
opt.smartindent = true -- Make indenting smart

opt.completeopt = "menuone,noinsert,noselect" -- Customize completions
opt.virtualedit = "block" -- Allow going past the end of line in visual block mode
opt.formatoptions = "qjl1" -- Don't autoformat comments
if vim.fn.has("nvim-0.9") == 1 then
	opt.shortmess:append("WcC") -- Reduce command line messages
	opt.splitkeep = "screen" -- Reduce scroll during window split
else
	opt.shortmess:append("Wc") -- Reduce command line messages
end
opt.pumblend = 10 -- Make builtin completion menus slightly transparent
opt.pumheight = 10 -- Make popup menu smaller
opt.winblend = 10 -- Make floating windows slightly transparent

opt.path = opt.path + "/home/hady/.local/bin/scripts/"
-- opt.listchars = 'extends:.,precedes:.,nbsp:␣' -- Define which helper symbols to show
opt.listchars = "tab:| ,space:.,extends:›,precedes:‹,nbsp:·,trail:·"
opt.list = true -- Show some helper symbols

-- Enable syntax highlighing if it wasn't already (as it is time consuming)
-- if vim.fn.exists("syntax_on") ~= 1 then
-- 	vim.cmd([[syntax enable]])
-- end
-- opt.autochdir = true
-- opt.grepprg="rg --vimgrep --smart-case --hidden"
-- opt.grepformat="%f:%l:%c:%m"
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
-- (Do not source the default filetype.vim) use filetype plugins that is much more faster thatn default filetype loader
-- vim.g.did_load_filetypes = 1
vim.o.foldlevel = 10000 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.fillchars = [[foldopen:,foldclose:]]
vim.o.foldcolumn = "0"

vim.o.exrc = true
-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

local fn = vim.fn
local fc = vim.opt.fillchars:get()
local function get_fold(lnum)
	if fn.foldlevel(lnum) <= fn.foldlevel(lnum - 1) then
		return " "
	end
	return fn.foldclosed(lnum) == -1 and fc.foldopen or fc.foldclose
end

_G.get_statuscol = function()
  print(vim.bo.filetype)
	if
		(vim.opt_local.signcolumn:get() == "yes" or vim.opt_local.signcolumn:get() == "auto")
		and vim.bo.filetype ~= "neo-tree"
	then
    print("set" .. vim.bo.filetype)
		return "%s%r%= " .. get_fold(vim.v.lnum) .. " "
	else
		return ""
	end
end

opt.foldmethod = "indent"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.statuscolumn = "%!v:lua.get_statuscol()"
