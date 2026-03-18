local now, now_if_args, later = Config.now, Config.now_if_args, Config.later

-- Common configuration presets. Example usage:
-- - `<C-s>` in Insert mode - save and go to Normal mode
-- - `go` / `gO` - insert empty line before/after in Normal mode
-- - `gy` / `gp` - copy / paste from system clipboard
-- - `\` + key - toggle common options. Like `\h` toggles highlighting search.
-- - `<C-hjkl>` (four combos) - navigate between windows.
-- - `<M-hjkl>` in Insert/Command mode - navigate in that mode.

now(function()
	require("mini.basics").setup({
		-- Manage options in 'plugin/10_options.lua' for didactic purposes
		options = { basic = false },
		mappings = {
			-- Create `<C-hjkl>` mappings for window navigation
			windows = true,
			-- Create `<M-hjkl>` mappings for navigation in Insert and Command modes
			move_with_alt = true,
		},
	})
end)

-- Icon provider. Usually no need to use manually. It is used by plugins like
-- 'mini.pick', 'mini.files', 'mini.statusline', and others.
now(function()
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
	later(MiniIcons.mock_nvim_web_devicons)

	-- Add LSP kind icons. Useful for 'mini.completion'.
	later(MiniIcons.tweak_lsp_kind)
end)

later(function()
	require("mini.extra").setup()
end)

now(function()
	require("mini.statusline").setup()
end)
now_if_args(function()
	-- Customize post-processing of LSP responses for a better user experience.
	-- Don't show 'Text' suggestions (usually noisy) and show snippets last.
	local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
	local process_items = function(items, base)
		return MiniCompletion.default_process_items(items, base, process_items_opts)
	end
	require("mini.completion").setup({
		lsp_completion = {
			-- Without this config autocompletion is set up through `:h 'completefunc'`.
			-- Although not needed, setting up through `:h 'omnifunc'` is cleaner
			-- (sets up only when needed) and makes it possible to use `<C-u>`.
			source_func = "omnifunc",
			auto_setup = false,
			process_items = process_items,
		},
	})

	-- Set 'omnifunc' for LSP completion only when needed.
	local on_attach = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
	end
	Config.new_autocmd("LspAttach", nil, on_attach, "Set 'omnifunc'")

	-- Advertise to servers that Neovim now supports certain set of completion and
	-- signature features through 'mini.completion'.
	vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })
end)

later(function()
	local ai = require("mini.ai")
	ai.setup({
		-- 'mini.ai' can be extended with custom textobjects
		custom_textobjects = {
			-- Make `aB` / `iB` act on around/inside whole *b*uffer
			B = MiniExtra.gen_ai_spec.buffer(),
			-- For more complicated textobjects that require structural awareness,
			-- use tree-sitter. This example makes `aF`/`iF` mean around/inside function
			-- definition (not call). See `:h MiniAi.gen_spec.treesitter()` for details.
			F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		},

		-- 'mini.ai' by default mostly mimics built-in search behavior: first try
		-- to find textobject covering cursor, then try to find to the right.
		-- Although this works in most cases, some are confusing. It is more robust to
		-- always try to search only covering textobject and explicitly ask to search
		-- for next (`an`/`in`) or last (`al`/`il`).
		-- Try this. If you don't like it - delete next line and this comment.
		search_method = "cover",
	})
end)

later(function()
	require("mini.bufremove").setup()
end)

later(function()
	local hipatterns = require("mini.hipatterns")
	local hi_words = MiniExtra.gen_highlighter.words
	hipatterns.setup({
		highlighters = {
			-- Highlight a fixed set of common words. Will be highlighted in any place,
			-- not like "only in comments".
			fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
			hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
			todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
			note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

			-- Highlight hex color string (#aabbcc) with that color as a background
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})
end)
later(function()
	require("mini.indentscope").setup()
end)
later(function()
	-- Create pairs not only in Insert, but also in Command line mode
	require("mini.pairs").setup({ modes = { command = true } })
end)
later(function()
	-- Define language patterns to work better with 'friendly-snippets'
	local latex_patterns = { "latex/**/*.json", "**/latex.json" }
	local lang_patterns = {
		tex = latex_patterns,
		plaintex = latex_patterns,
		-- Recognize special injected language of markdown tree-sitter parser
		markdown_inline = { "markdown.json" },
	}

	local snippets = require("mini.snippets")
	local config_path = vim.fn.stdpath("config")
	snippets.setup({
		snippets = {
			-- Always load 'snippets/global.json' from config directory
			snippets.gen_loader.from_file(config_path .. "/snippets/global.json"),
			-- Load from 'snippets/' directory of plugins, like 'friendly-snippets'
			snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
		},
	})

	-- By default snippets available at cursor are not shown as candidates in
	-- 'mini.completion' menu. This requires a dedicated in-process LSP server
	-- that will provide them. To have that, uncomment next line (use `gcc`).
	-- MiniSnippets.start_lsp_server()
end)
later(function()
	require("mini.splitjoin").setup()
end)
later(function()
	require("mini.surround").setup()
end)

-- Special key mappings. Provides helpers to map:
-- - Multi-step actions. Apply action 1 if condition is met; else apply
--   action 2 if condition is met; etc.
-- - Combos. Sequence of keys where each acts immediately plus execute extra
--   action if all are typed fast enough. Useful for Insert mode mappings to not
--   introduce delay when typing mapping keys without intention to execute action.
--
-- See also:
-- - `:h MiniKeymap-examples` - examples of common setups
-- - `:h MiniKeymap.map_multistep()` - map multi-step action
-- - `:h MiniKeymap.map_combo()` - map combo
later(function()
	require("mini.keymap").setup()
	-- Navigate 'mini.completion' menu with `<Tab>` /  `<S-Tab>`
	MiniKeymap.map_multistep("i", "<Tab>", { "pmenu_next" })
	MiniKeymap.map_multistep("i", "<S-Tab>", { "pmenu_prev" })
	-- On `<CR>` try to accept current completion item, fall back to accounting
	-- for pairs from 'mini.pairs'
	MiniKeymap.map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
	-- On `<BS>` just try to account for pairs from 'mini.pairs'
	MiniKeymap.map_multistep("i", "<BS>", { "minipairs_bs" })
	local map_combo = require("mini.keymap").map_combo

	-- Support most common modes. This can also contain 't', but would
	-- only mean to press `<Esc>` inside terminal.
	-- local mode = { "i", "c", "x", "s" }
	local mode = { "i" }
	map_combo(mode, "jk", "<BS><BS><Esc>")

	-- To not have to worry about the order of keys, also map "kj"

	-- Escape into Normal mode from Terminal mode
	-- map_combo("t", "jk", "<BS><BS><C-\\><C-n>")
	-- map_combo("t", "kj", "<BS><BS><C-\\><C-n>")
end)

-- Example usage:
-- - `<Leader>ed` - open current working directory
-- - `<Leader>ef` - open directory of current file (needs to be present on disk)
--
-- Basic navigation:
-- - `l` - go in entry at cursor: navigate into directory or open file
-- - `h` - go out of focused directory
-- - Navigate window as any regular buffer
-- - Press `g?` inside explorer to see more mappings
--
-- Basic manipulation:
-- - After any following action, press `=` in Normal mode to synchronize, read
--   carefully about actions, press `y` or `<CR>` to confirm
-- - New entry: press `o` and type its name; end with `/` to create directory
-- - Rename: press `C` and type new name
-- - Delete: type `dd`
-- - Move/copy: type `dd`/`yy`, navigate to target directory, press `p`
--
-- See also:
-- - `:h MiniFiles-navigation` - more details about how to navigate
-- - `:h MiniFiles-manipulation` - more details about how to manipulate
-- - `:h MiniFiles-examples` - examples of common setups
now_if_args(function()
	-- Enable directory/file preview
	require("mini.files").setup({ windows = { preview = true } })

	-- Add common bookmarks for every explorer. Example usage inside explorer:
	-- - `'c` to navigate into your config directory
	-- - `g?` to see available bookmarks
	local add_marks = function()
		MiniFiles.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
		MiniFiles.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
	end
	Config.new_autocmd("User", "MiniFilesExplorerOpen", add_marks, "Add bookmarks")
end)

-- Miscellaneous small but useful functions. Example usage:
-- - `<Leader>oz` - toggle between "zoomed" and regular view of current buffer
-- - `<Leader>or` - resize window to its "editable width"
-- - `:lua put_text(vim.lsp.get_clients())` - put output of a function below
--   cursor in current buffer. Useful for a detailed exploration.
-- - `:lua put(MiniMisc.stat_summary(MiniMisc.bench_time(f, 100)))` - run
--   function `f` 100 times and report statistical summary of execution times
now_if_args(function()
  -- Makes `:h MiniMisc.put()` and `:h MiniMisc.put_text()` public
  require('mini.misc').setup()

  -- Change current working directory based on the current file path. It
  -- searches up the file tree until the first root marker ('.git' or 'Makefile')
  -- and sets their parent directory as a current directory.
  -- This is helpful when simultaneously dealing with files from several projects.
  MiniMisc.setup_auto_root()

  -- Restore latest cursor position on file open
  MiniMisc.setup_restore_cursor()

  -- Synchronize terminal emulator background with Neovim's background to remove
  -- possibly different color padding around Neovim instance
  MiniMisc.setup_termbg_sync()
end)

later(function()
	local miniclue = require("mini.clue")
  -- stylua: ignore
  miniclue.setup({
      window={
          delay=500,
          config={
              width='auto'
          }
      },
    -- Define which clues to show. By default shows only clues for custom mappings
    -- (uses `desc` field from the mapping; takes precedence over custom clue).
    clues = {
      -- This is defined in 'plugin/20_keymaps.lua' with Leader group descriptions
      Config.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.square_brackets(),
      -- This creates a submode for window resize mappings. Try the following:
      -- - Press `<C-w>s` to make a window split.
      -- - Press `<C-w>+` to increase height. Clue window still shows clues as if
      --   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
      --   Try pressing `-` to decrease height.
      -- - Stop submode either by `<Esc>` or by any key that is not in submode.
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    -- Explicitly opt-in for set of common keys to trigger clue window
    triggers = {
      { mode = { 'n', 'x' }, keys = '<Leader>' }, -- Leader triggers
      { mode =   'n',        keys = '\\' },       -- mini.basics
      { mode = { 'n', 'x' }, keys = '[' },        -- mini.bracketed
      { mode = { 'n', 'x' }, keys = ']' },
      { mode =   'i',        keys = '<C-x>' },    -- Built-in completion
      { mode = { 'n', 'x' }, keys = 'g' },        -- `g` key
      { mode = { 'n', 'x' }, keys = "'" },        -- Marks
      { mode = { 'n', 'x' }, keys = '`' },
      { mode = { 'n', 'x' }, keys = '"' },        -- Registers
      { mode = { 'i', 'c' }, keys = '<C-r>' },
      { mode =   'n',        keys = '<C-w>' },    -- Window commands
      { mode = { 'n', 'x' }, keys = 's' },        -- `s` key (mini.surround, etc.)
      { mode = { 'n', 'x' }, keys = 'z' },        -- `z` key
    },
  })
end)
