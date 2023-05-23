return {
  {
    -- better search and replace with preserving case and change word case by cru,crs,crc,cr.
    "tpope/vim-abolish"
  },
  {
    -- peek line when writeing line number
    "nacro90/numb.nvim",
    opts = {
      show_numbers = true,         -- Enable 'number' for the window while peeking
      show_cursorline = true,      -- Enable 'cursorline' for the window while peeking
      hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
      number_only = false,         -- Peek only when the command is only a number instead of when it starts with a number
      centered_peeking = true,     -- Peeked line will be centered relative to window
    }
  },
  {
    "metakirby5/codi.vim",
    cmd = { "Codi", "CodiSelect", "CodiNew", "CodiExpand" }
  },
  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", enabled = false, event = "VeryLazy" },
  {
    'Wansmer/treesj',
    keys = { 'gs' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      local tsj = require('treesj')

      local langs = { --[[ configuration for languages ]] }

      tsj.setup({
        -- Use default keymaps
        -- (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = false,
        -- Node with syntax error will not be formatted
        check_syntax_error = true,
        -- If line after join will be longer than max value,
        -- node will not be formatted
        max_join_length = 120,
        -- hold|start|end:
        -- hold - cursor follows the node/place on which it was called
        -- start - cursor jumps to the first symbol of the node being formatted
        -- end - cursor jumps to the last symbol of the node being formatted
        cursor_behavior = 'hold',
        -- Notify about possible problems or not
        notify = true,
        langs = langs,
        -- Use `dot` for repeat action
        dot_repeat = true,
      })
      require('config.keymaps').split_join_setup()
    end,
  },
  {
    "smjonas/live-command.nvim",
    config = function()
      require("live-command").setup {
        commands = {
          Norm = { cmd = "norm" },
        },
        defaults = {
          enable_highlighting = true,
          inline_highlighting = true,
          hl_groups = {
            insertion = "DiffAdd",
            deletion = "DiffDelete",
            change = "DiffChange",
          },
        },
        debug = false,
      }
    end,
  },
  {
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    keys = {
      { "gx", desc = "Goto link" },
    },
    -- you can specify also another config if you want
    config = function()
      require("gx").setup {
        open_browser_app = "open", -- specify your browser app; default for macos is "open" and for linux "xdg-open"
        handlers = {
          plugin = true,           -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true,           -- open github issues
          package_json = true,     -- open dependencies from package.json
        },
      }
    end,
  },
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    opts = {}
  },
  {
    "alexghergh/nvim-tmux-navigation",
    opts = {
      keybindings = {
        left = "<C-w>h",
        down = "<C-w>j",
        up = "<C-w>k",
        right = "<C-w>l",
        last_active = "<C-\\>",
        next = "<C-w><Space>",
      }
    }
  },
  {
    "dhruvasagar/vim-zoom"
  },
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>d", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>D", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
    },
  },
  {
    "Shatur/neovim-session-manager",
    cmd = "SessionManager",
    keys = {
      {
        "<leader>qs",
        "<cmd>SessionManager load_session<cr>",
        desc = "Find Session",
      },
      {
        "<leader>ql",
        "<cmd>SessionManager load_last_session<cr>",
        desc = "Restore Last Session",
      },
      {
        "<leader>qd",
        "<cmd>SessionManager save_current_session<cr>",
        desc = "Save Current Session",
      },
    },
    config = function()
      local Path = require('plenary.path')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),             -- The directory where the session files will be saved.
        path_replacer = '__',                                                    -- The character to which the path separator will be replaced for session files.
        colon_replacer = '++',                                                   -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true,                                            -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true,                                       -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_dirs = {},                                               -- A list of directories where the session will not be autosaved.
        autosave_ignore_filetypes = {                                            -- All buffers of these file types will be closed before the session is saved.
          'gitcommit',
        },
        autosave_ignore_buftypes = {},    -- All buffers of these bufer types will be closed before the session is saved.
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80,             -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      })
    end,
  }
}
