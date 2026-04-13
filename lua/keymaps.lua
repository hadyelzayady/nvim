-- Keymaps configuration for Neovim v0.12+
-- Modular keybinding system

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local buf_opts = { noremap = true, silent = true, buffer = 0 }

--=============== Leader Keys ===============
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--=============== Core/Normal Mode ===============
map("n", "<Space>", "<Nop>", opts) -- Space as leader
map("n", "j", "gj", opts) -- Move by visual line
map("n", "k", "gk", opts)
map("n", "H", "^", opts) -- Go to line start
map("n", "L", "g_", opts) -- Go to line end
map("n", "n", "nzzzv", opts) -- Center after search
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts) -- Join lines without moving
map("n", "Q", "@q", opts) -- Execute macro
map("n", "Y", "y$", opts) -- Yank to end of line

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window manipulation
map("n", "<leader>sv", "<C-w>v", opts) -- Split vertical
map("n", "<leader>sh", "<C-w>s", opts) -- Split horizontal
map("n", "<leader>se", "<C-w>=", opts) -- Equalize windows
map("n", "<leader>sx", "<C-w>c", opts) -- Close window
map("n", "<leader>so", "<C-w>o", opts) -- Only window

-- Quick access
map("n", "<leader>;", "m`A;<Esc>``", opts) -- Add semicolon
map("n", "<leader>,", "m`A,<Esc>``", opts) -- Add comma
map("n", "<leader>=", "<C-a>", opts) -- Increment
map("n", "<leader>-", "<C-x>", opts) -- Decrement

-- Text objects (use whichkey or mini.ai later)
map("x", "p", '"_dP', opts) -- Paste without losing register

--=============== Visual Mode ===============
-- Stay in visual mode after shifting
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Move text in visual mode
map("v", "J", ":m '>+1<CR>gv", opts)
map("v", "K", ":m '<-2<CR>gv", opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

--=============== Insert Mode ===============
map("i", "jj", "<Esc>", opts)
map("i", "jk", "<Esc>", opts)
map("i", "jj", "<Esc>", opts)

--=============== Terminal Mode ===============
map("t", "jj", "<C-\\><C-n>", opts)
map("t", "jk", "<C-\\><C-n>", opts)
map("t", "<C-h>", "<C-w>h", opts)
map("t", "<C-j>", "<C-w>j", opts)
map("t", "<C-k>", "<C-w>k", opts)
map("t", "<C-l>", "<C-w>l", opts)

--=============== Command Mode ===============
map("c", "<C-j>", "<Down>", opts)
map("c", "<C-k>", "<Up>", opts)
map("c", "<C-a>", "<Home>", opts)
map("c", "<C-e>", "<End>", opts)

--=============== Special Keys ===============
map("n", "<Esc>", ":noh<CR>", opts) -- Clear search highlight

-- Quickfix navigation
map("n", "]q", ":cnext<CR>", opts)
map("n", "[q", ":cprev<CR>", opts)
map("n", "]Q", ":clast<CR>", opts)
map("n", "[Q", ":cfirst<CR>", opts)

-- Location list navigation
map("n", "]l", ":lnext<CR>", opts)
map("n", "[l", ":lprev<CR>", opts)
map("n", "]L", ":llast<CR>", opts)
map("n", "[L", ":lfirst<CR>", opts)

-- Buffer navigation
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- Save/Write
map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>x", ":xit<CR>", opts)

----------------- File Operations ---------------
map("n", "<leader>ff", ":find<Space>", { silent = false })
map("n", "<leader>fs", ":saveas<Space>", { silent = false })
map("n", "<leader>fr", ":edit<Space>", { silent = false })

----------------- Toggle Options ---------------
map("n", "<leader>ts", ":set invpaste<CR>", opts) -- Toggle paste
map("n", "<leader>tn", ":set invnumber<CR>", opts) -- Toggle number
map("n", "<leader>tr", ":set invrelativenumber<CR>", opts) -- Toggle relativenumber

----------------- Fold Operations ---------------
map("n", "zR", ":set foldlevel=20<CR>", opts)
map("n", "zM", ":set foldlevel=0<CR>", opts)
map("n", "za", "za", opts)
map("n", "zc", "zc", opts)
map("n", "zO", "zO", opts)
map("n", "zC", "zC", opts)
map("n", "zd", "zd", opts)
map("n", "zD", "zD", opts)

--=============== FZF-Lua ===============
map("n", "<leader>ff", ":FzfLua files<CR>", opts)
map("n", "<leader>fg", ":FzfLua grep<CR>", opts)
map("n", "<leader>fw", ":FzfLua grep_cword<CR>", opts)
map("n", "<leader>fb", ":FzfLua buffers<CR>", opts)
map("n", "<leader>fh", ":FzfLua oldfiles<CR>", opts)
map("n", "<leader>fc", ":FzfLua commands<CR>", opts)
map("n", "<leader>fs", ":FzfLua live_grep<CR>", opts)
map("n", "<leader>fd", ":FzfLua git_files<CR>", opts)
map("n", "<leader>fl", ":FzfLua lines<CR>", opts)
map("n", "<leader>ft", ":FzfLua tags<CR>", opts)
map("n", "<leader>fr", ":FzfLua registers<CR>", opts)
map("n", "<leader>fk", ":FzfLua keymaps<CR>", opts)

--=============== File Tree ===============
map("n", "<leader>e", ":Fyler kind=split_left_most<CR>", opts)

--=============== Conform (Formatter) ===============
-- map("n", "<leader>f", ":Format<CR>", opts)
map("n", "<leader>fm", ":FormatWrite<CR>", opts)

--=============== Aerial (Code Outline) ===============
map("n", "<leader>ao", ":AerialToggle<CR>", opts)
