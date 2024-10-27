-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.number = true             -- Print line number
opt.splitbelow = true         -- Horizontal splits will be below
opt.splitright = true         -- Vertical splits will be to the right
opt.termguicolors = true      -- Enable gui colors
opt.signcolumn = "auto:1-3"   -- Always show sign column (otherwise it will shift text)
opt.conceallevel = 0

opt.mouse = ""     -- Enable mouse mode
opt.scrolloff = 2  -- Lines of context

opt.confirm = true -- Confirm to save changes before exiting modified buffer

-- opt.undodir = require("utils.undo").undodir
-- opt.undolevels = 10000

opt.expandtab = true  -- Use spaces instead of tabs
opt.shiftround = true -- Round indent
opt.shiftwidth = 2    -- Size of an indent
opt.tabstop = 2       -- Number of spaces tabs count for

opt.linebreak = true  -- Wrap long lines at 'breakat' (if 'wrap' is set)

-- when open new line will detect current indect and place the cursor to this indent
opt.smartindent = true -- Make indenting smart

opt.cursorline = false -- Highlight current line
opt.cursorcolumn = false
opt.cursorlineopt = "number"
opt.spell = true
opt.spelllang = { "en_us" }

-- opt.completeopt = "menuone,noinsert,noselect" -- Customize completions
opt.completeopt = "" -- Customize completions

opt.smartcase = true                          -- Don't ignore case when searching if pattern has upper case
opt.ignorecase = true                         -- Ignore case when searching (use `\C` to force not doing that)

opt.listchars = "tab:| ,lead:.,trail:-,extends:›,precedes:‹"
opt.list = true

opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]
vim.cmd("syntax off")

-- opt.cmdheight = 0
-- fold
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- swap
opt.swapfile = false
opt.backup = false
opt.undofile = false
-- jumps
opt.jumpoptions = "stack,view"


-- performance optimize
opt.updatetime = 300                                  -- Default is 4000ms
opt.ttyfast = true                                    -- Optimize for fast terminals
opt.lazyredraw = true                                 -- Redraw only when necessary

opt.history = 100                                     -- Default is 1000, set lower if not needed
opt.hlsearch = true                                  -- Disable highlight on search

vim.opt.diffopt:append("internal,algorithm:patience") -- Use faster algorithm

vim.opt.showmode = false                              -- Don't show mode, it's redundant with a statusline


vim.opt.foldmethod = "manual" -- Disable automatic folding
vim.opt.foldenable = false    -- Don't open files with folds
vim.opt.pumheight = 10        -- Limit popup menu height
vim.o.laststatus = 3
