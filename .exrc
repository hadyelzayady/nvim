let s:cpo_save=&cpo
set cpo&vim
imap <M-Bslash> <Plug>(codeium-complete)
imap <M-[> <Plug>(codeium-previous)
imap <M-]> <Plug>(codeium-next-or-complete)
imap <Plug>(codeium-complete) <Cmd>call codeium#Complete()
imap <Plug>(codeium-previous) <Cmd>call codeium#CycleCompletions(-1)
imap <Plug>(codeium-next-or-complete) <Cmd>call codeium#CycleOrComplete()
imap <Plug>(codeium-next) <Cmd>call codeium#CycleCompletions(1)
imap <Plug>(codeium-dismiss) <Cmd>call codeium#Clear()
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <silent> <C-G>Þ <Nop>
inoremap <C-G>S <Plug>(nvim-surround-insert-line)
inoremap <C-G>s <Plug>(nvim-surround-insert)
cnoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
inoremap <C-W> u
inoremap <C-U> u
nnoremap  <Cmd>FzfLua oldfiles
vnoremap <NL> :m '>+1gv=gv
vnoremap  :m '<-2gv=gv
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
nnoremap <silent> Þ <Nop>
nnoremap <silent>  <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
nmap m <Plug>(zoom-toggle)
nnoremap  <Cmd>noh
nnoremap <silent>  rÞ <Nop>
nnoremap <silent>  r <Cmd>lua require("which-key").show(" r", {mode = "n", auto = true})
nnoremap <silent>  Þ <Nop>
nnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
nnoremap  gS :Gitsigns undo_stage_hunk
nnoremap  gs :Gitsigns stage_hunk
nnoremap  gR :Gitsigns reset_buffer
nnoremap <silent>  gr :Gitsigns reset_hunk
nnoremap  gk :Gitsigns prev_hunk
nnoremap  gj :Gitsigns next_hunk
nnoremap  gp :Gitsigns preview_hunk_inline
nnoremap  gB :Gitsigns toggle_current_line_blame
nnoremap  gb :Gitsigns blame_line
xnoremap <silent>  tÞ <Nop>
xnoremap <silent>  rÞ <Nop>
xnoremap <silent>  xÞ <Nop>
xnoremap <silent>  nCÞ <Nop>
xnoremap <silent>  nÞ <Nop>
xnoremap <silent>  	Þ <Nop>
xnoremap <silent>  qÞ <Nop>
xnoremap <silent>  mÞ <Nop>
xnoremap <silent>  fÞ <Nop>
xnoremap <silent>  bÞ <Nop>
xnoremap <silent>  wÞ <Nop>
xnoremap <silent>  cÞ <Nop>
nnoremap <silent>  bÞ <Nop>
xnoremap <silent>  sÞ <Nop>
xnoremap <silent>  lÞ <Nop>
xnoremap <silent>  gÞ <Nop>
xnoremap <silent>  Þ <Nop>
xnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "v", auto = true})
nnoremap <silent>  jÞ <Nop>
nnoremap <silent>  sÞ <Nop>
nnoremap <silent>  gÞ <Nop>
nnoremap <silent>  tÞ <Nop>
nnoremap <silent>  nCÞ <Nop>
nnoremap <silent>  nÞ <Nop>
nnoremap <silent>  fÞ <Nop>
nnoremap <silent>  xÞ <Nop>
nnoremap <silent>  wÞ <Nop>
nnoremap <silent>  	Þ <Nop>
nnoremap <silent>  qÞ <Nop>
nnoremap <silent>  mÞ <Nop>
nnoremap <silent>  cÞ <Nop>
nnoremap <silent>  lÞ <Nop>
nnoremap <silent>  cS <Cmd>AerialNavToggle
nnoremap <silent>  cs <Cmd>AerialToggle
nnoremap <silent>  sS <Cmd>FzfLua lsp_live_workspace_symbols
nnoremap <silent>  ss <Cmd>FzfLua lsp_document_symbols
vnoremap <silent>  la <Cmd>FzfLua lsp_code_actions
nnoremap <silent>  la <Cmd>FzfLua lsp_code_actions
nnoremap  nCt <Cmd>CccConvert
nnoremap  nCp <Cmd>CccPick
nnoremap  nc <Cmd>TSContextToggle
nnoremap  nr <Cmd>Neotree reveal
nnoremap  n* <Cmd>lua require('utils.toggle').toggle_conceal()
nnoremap  tf <Cmd>ToggleTerm direction=float
nnoremap  tt <Cmd>ToggleTerm direction=tab
nnoremap  tv <Cmd>ToggleTerm direction=vertical
nnoremap  ts :ToggleTerm direction=horizontal
nnoremap  xt <Cmd>TodoTrouble
nnoremap  xX <Cmd>TroubleToggle workspace_diagnostics 
nnoremap  xx <Cmd>TroubleToggle document_diagnostics 
nnoremap  mf <Cmd>FzfLua filetypes
vnoremap  R <Cmd>lua require('telescope').extensions.refactoring.refactors()
nnoremap  h <Cmd>UndotreeToggle
nnoremap  jj <Cmd>HopChar2
nnoremap  jl <Cmd>HopLine
nnoremap  ru <Cmd>lua require('dapui').toggle()
nnoremap  rb <Cmd>DapToggleBreakpoint
nnoremap  rd <Cmd>DapContinue
nnoremap  ga <Cmd>lua require('telescope').extensions.githubcoauthors.coauthors()
vnoremap  gh :'<,'>DiffviewFileHistory %
nnoremap  gh :DiffviewFileHistory %
nnoremap  gU <Cmd>Gin push
nnoremap  gu <Cmd>Gin pull
nnoremap  gc <Cmd>FzfLua git_branches
nnoremap  gd :DiffviewOpen -- %
nnoremap  gn <Cmd>Neogit
nnoremap <silent>  gg <Cmd>LazyGit
nnoremap  qW <Cmd>silent! w
nnoremap  qw <Cmd>silent! wall
nnoremap  qp <Cmd>lua require'telescope'.extensions.projects.projects{}
nnoremap  Q <Cmd>silent! qa!
nnoremap  qQ <Cmd>qa
nnoremap  qq <Cmd>q
nnoremap  sg <Cmd>FzfLua live_grep_glob
vnoremap  sv <Cmd>FzfLua grep_visual
nnoremap  sv <Cmd>FzfLua grep_visual
nnoremap  sp <Cmd>FzfLua grep_project
nnoremap  sb <Cmd>FzfLua grep_curbuf
nnoremap  sw <Cmd>FzfLua grep_cword
nnoremap  fr <Cmd>FzfLua resume
nnoremap  fm <Cmd>FzfLua marks
nnoremap  fn <Cmd>enew
nnoremap  fb <Cmd>FzfLua buffers
nnoremap  ff <Cmd>lua require('utils.find').find_project_files()
nnoremap  	p <Cmd>tabprevious
nnoremap  	d <Cmd>tabclose
nnoremap  	n <Cmd>tabnext
nnoremap  		 <Cmd>tabnew
nnoremap  	f <Cmd>tabfirst
nnoremap  	l <Cmd>tablast
nnoremap  wv v
nnoremap  ws s
nnoremap  wd c
nnoremap  ww p
nnoremap <silent> !iÞ <Nop>
nnoremap <silent> !aÞ <Nop>
nnoremap <silent> !Þ <Nop>
nnoremap <silent> ! <Cmd>lua require("which-key").show("!", {mode = "n", auto = true})
xnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "v", auto = true})
nnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "n", auto = true})
nnoremap <silent> # #<Cmd>lua require('hlslens').start()
xnoremap # y?\V"
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap <silent> ' <Cmd>lua require("which-key").show("'", {mode = "n", auto = true})
nnoremap <silent> * *<Cmd>lua require('hlslens').start()
xnoremap * y/\V"
nnoremap <silent> <iÞ <Nop>
nnoremap <silent> <i <Cmd>lua require("which-key").show("<i", {mode = "n", auto = true})
nnoremap <silent> <aÞ <Nop>
nnoremap <silent> <a <Cmd>lua require("which-key").show("<a", {mode = "n", auto = true})
nnoremap <silent> >iÞ <Nop>
nnoremap <silent> >i <Cmd>lua require("which-key").show(">i", {mode = "n", auto = true})
nnoremap <silent> >aÞ <Nop>
nnoremap <silent> >a <Cmd>lua require("which-key").show(">a", {mode = "n", auto = true})
xnoremap @ :call ExecuteMacroOverVisualRange()
nnoremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<Cmd>lua require('hlslens').start()
xnoremap S <Plug>(nvim-surround-visual)
vnoremap <silent> X "_X
nnoremap <silent> X "_X
nnoremap Y y$
nnoremap [g :Gitsigns prev_hunk
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
nnoremap ]g :Gitsigns next_hunk
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap <silent> ` <Cmd>lua require("which-key").show("`", {mode = "n", auto = true})
xmap a% <Plug>(MatchitVisualTextObject)
nnoremap cS <Plug>(nvim-surround-change-line)
nnoremap cs <Plug>(nvim-surround-change)
nnoremap <silent> ciÞ <Nop>
nnoremap <silent> caÞ <Nop>
nnoremap <silent> cÞ <Nop>
nnoremap <silent> c <Cmd>lua require("which-key").show("c", {mode = "n", auto = true})
nmap cr <Plug>(abolish-coerce-word)
nnoremap <silent> dÞ <Nop>
nnoremap <silent> d <Cmd>lua require("which-key").show("d", {mode = "n", auto = true})
nnoremap ds <Plug>(nvim-surround-delete)
nnoremap <silent> diÞ <Nop>
nnoremap <silent> daÞ <Nop>
nnoremap gI <Cmd>Glance implementations
nnoremap gt <Cmd>Glance type_definitions
nnoremap gr <Cmd>Glance references
nnoremap gd <Cmd>Glance definitions
xnoremap gS <Plug>(nvim-surround-visual-line)
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
nnoremap <silent> gUiÞ <Nop>
nnoremap <silent> gUaÞ <Nop>
nnoremap <silent> gUÞ <Nop>
nnoremap <silent> guiÞ <Nop>
nnoremap <silent> guaÞ <Nop>
nnoremap <silent> guÞ <Nop>
nnoremap <silent> g~iÞ <Nop>
nnoremap <silent> g~aÞ <Nop>
nnoremap <silent> g~Þ <Nop>
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
nnoremap gc <Plug>(comment_toggle_linewise)
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap <silent> g# g#<Cmd>lua require('hlslens').start()
nnoremap <silent> g* g*<Cmd>lua require('hlslens').start()
nnoremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<Cmd>lua require('hlslens').start()
vnoremap <silent> p "_dP
nnoremap <silent> viÞ <Nop>
nnoremap <silent> vaÞ <Nop>
nnoremap <silent> vÞ <Nop>
nnoremap <silent> v <Cmd>lua require("which-key").show("v", {mode = "n", auto = true})
vnoremap <silent> x "_x
nnoremap <silent> x "_x
nnoremap ySS <Plug>(nvim-surround-normal-cur-line)
nnoremap yS <Plug>(nvim-surround-normal-line)
nnoremap yss <Plug>(nvim-surround-normal-cur)
nnoremap ys <Plug>(nvim-surround-normal)
nnoremap <silent> yiÞ <Nop>
nnoremap <silent> yaÞ <Nop>
nnoremap <silent> yÞ <Nop>
nnoremap <silent> y <Cmd>lua require("which-key").show("y", {mode = "n", auto = true})
nnoremap <silent> zfiÞ <Nop>
nnoremap <silent> zfaÞ <Nop>
nnoremap <silent> zfÞ <Nop>
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
xnoremap <silent> <Plug>(nvim-surround-visual-line) <Cmd>lua require'nvim-surround'.visual_surround({ line_mode = true })
xnoremap <silent> <Plug>(nvim-surround-visual) <Cmd>lua require'nvim-surround'.visual_surround({ line_mode = false })
nnoremap <silent> <C-W>Þ <Nop>
nnoremap <silent> <C-W> <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
nnoremap <Plug>CtrlSFQuickfixPrompt :CtrlSFQuickfix 
nnoremap <Plug>CtrlSFPrompt :CtrlSF 
nmap <C-W>m <Plug>(zoom-toggle)
nnoremap <silent> <Plug>(zoom-toggle) :call zoom#toggle()
nnoremap <C-E> <Cmd>FzfLua oldfiles
vnoremap <C-K> :m '<-2gv=gv
vnoremap <C-J> :m '>+1gv=gv
nnoremap <C-Right> <Cmd>vertical resize +2
nnoremap <C-Left> <Cmd>vertical resize -2
nnoremap <C-Down> <Cmd>resize -2
nnoremap <C-Up> <Cmd>resize +2
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap <silent> Þ <Nop>
inoremap S <Plug>(nvim-surround-insert-line)
inoremap s <Plug>(nvim-surround-insert)
cnoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
inoremap  u
inoremap  u
inoremap  <Cmd>noh
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamedplus
set completeopt=menu,menuone,noselect,noinsert
set confirm
set expandtab
set fillchars=diff:╱,foldclose:,foldopen:
set helplang=en
set ignorecase
set indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,<:>,=elif,=except
set laststatus=3
set noloadplugins
set mouse=a
set packpath=/usr/local/share/nvim/runtime
set pumblend=10
set pumheight=10
set runtimepath=~/.config/nvim,~/.local/share/nvim/lazy/lazy.nvim,~/.local/share/nvim/lazy/formatter.nvim,~/.local/share/nvim/lazy/friendly-snippets,~/.local/share/nvim/lazy/LuaSnip,~/.local/share/nvim/lazy/codeium.vim,~/.local/share/nvim/lazy/cmp-conventionalcommits,~/.local/share/nvim/lazy/cmp_luasnip,~/.local/share/nvim/lazy/cmp-calc,~/.local/share/nvim/lazy/cmp-path,~/.local/share/nvim/lazy/cmp-npm,~/.local/share/nvim/lazy/cmp-git,~/.local/share/nvim/lazy/cmp-buffer,~/.local/share/nvim/lazy/nvim-cmp,~/.local/share/nvim/lazy/nvim-autopairs,~/.local/share/nvim/lazy/trouble.nvim,~/.local/share/nvim/lazy/github-coauthors.nvim,~/.local/share/nvim/lazy/telescope-fzf-native.nvim,~/.local/share/nvim/lazy/telescope.nvim,~/.local/share/nvim/lazy/nvim-surround,~/.local/share/nvim/lazy/which-key.nvim,~/.local/share/nvim/lazy/Comment.nvim,~/.local/share/nvim/lazy/vim-repeat,~/.local/share/nvim/lazy/nvim-treesitter-textobjects,~/.local/share/nvim/lazy/mini.ai,~/.local/share/nvim/lazy/nvim-web-devicons,~/.local/share/nvim/lazy/hlchunk.nvim,~/.local/share/nvim/lazy/nvim-dap-python,~/.local/share/nvim/lazy/template-string.nvim,~/.local/share/nvim/lazy/nvim-treesitter,~/.local/share/nvim/lazy/plenary.nvim,~/.local/share/nvim/lazy/diffview.nvim,~/.local/share/nvim/lazy/gitsigns.nvim,~/.local/share/nvim/lazy/hydra.nvim,~/.local/share/nvim/lazy/nvim-dap-virtual-text,~/.local/share/nvim/lazy/nvim-hlslens,~/.local/share/nvim/lazy/hop.nvim,~/.local/share/nvim/lazy/nvim-notify,~/.local/share/nvim/lazy/nui.nvim,~/.local/share/nvim/lazy/noice.nvim,~/.local/share/nvim/lazy/dressing.nvim,~/.local/share/nvim/lazy/numb.nvim,~/.local/share/nvim/lazy/stay-in-place.nvim,~/.local/share/nvim/lazy/kanagawa.nvim,~/.local/share/nvim/lazy/vim-abolish,~/.local/share/nvim/lazy/lualine.nvim,~/.local/share/nvim/lazy/statuscol.nvim,~/.local/share/nvim/lazy/cmp-nvim-lsp,~/.local/share/nvim/lazy/nvim-vtsls,~/.local/share/nvim/lazy/nvim-lspconfig,~/.local/share/nvim/lazy/promise-async,~/.local/share/nvim/lazy/nvim-ufo,~/.local/share/nvim/lazy/nvim-dap-ui,~/.local/share/nvim/lazy/nvim-dap,~/.local/share/nvim/lazy/nvim-highlight-colors,~/.local/share/nvim/lazy/fzf,~/.local/share/nvim/lazy/nvim-bqf,~/.local/share/nvim/lazy/live-command.nvim,~/.local/share/nvim/lazy/incline.nvim,~/.local/share/nvim/lazy/ctrlsf.vim,~/.local/share/nvim/lazy/vim-zoom,~/.local/share/nvim/lazy/better-escape.nvim,/usr/local/share/nvim/runtime,/usr/local/share/nvim/runtime/pack/dist/opt/matchit,/usr/local/lib/nvim,~/.local/share/nvim/lazy/cmp-conventionalcommits/after,~/.local/share/nvim/lazy/cmp_luasnip/after,~/.local/share/nvim/lazy/cmp-calc/after,~/.local/share/nvim/lazy/cmp-path/after,~/.local/share/nvim/lazy/cmp-buffer/after,~/.local/share/nvim/lazy/cmp-nvim-lsp/after,~/.local/share/nvim/lazy/nvim-bqf/after,~/.local/share/nvim/lazy/ctrlsf.vim/after,~/.config/nvim/after,~/.local/state/nvim/lazy/readme
set scrolloff=4
set shiftround
set shiftwidth=2
set shortmess=OicFfInWtxolT
set noshowmode
set sidescrolloff=8
set smartcase
set smartindent
set spelllang=en_us
set splitbelow
set splitright
set statusline=%#Normal#
set tabstop=2
set termguicolors
set timeoutlen=300
set undofile
set undolevels=10000
set updatetime=200
set wildignore=*.pyc
set window=58
set winminwidth=5
" vim: set ft=vim :
