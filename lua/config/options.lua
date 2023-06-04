vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
-- opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect,noinsert"

-- pum is the complettion list of vim command for example when use :set the list will have max of 10 items and scrollable
opt.pumblend = 10 -- Popup blend(transparency)
opt.pumheight = 10 -- Maximum number of entries in a popup

opt.conceallevel = 0 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
-- opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.laststatus = 0
-- opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

opt.expandtab = true -- Use spaces instead of tabs
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for

opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.splitkeep = "cursor"
opt.shortmess:append { C = true }
opt.wrap = true -- wrap long line
opt.linebreak = true

opt.spell = true
opt.spelllang = { "en_us" }
-- opt.grepprg="rg --vimgrep --smart-case --hidden"
-- opt.grepformat="%f:%l:%c:%m"
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
-- (Do not source the default filetype.vim) use filetype plugins that is much more faster thatn default filetype loader
-- vim.g.did_load_filetypes = 1
vim.o.foldlevel = 10000 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.fillchars = [[foldopen:,foldclose:]]
vim.o.foldcolumn = '1'

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
