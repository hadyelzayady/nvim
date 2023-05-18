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
  }

}
