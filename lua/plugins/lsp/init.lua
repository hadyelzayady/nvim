return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Setup language servers.
      require('plugins.lsp.servers_configs').setup()
      require('plugins.lsp.diagnostics').setup()
      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      require("config.keymaps").lsp_global_setup();

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          require("config.keymaps").on_attach_setup(ev);
        end,
      })
    end,
    dependencies = { "b0o/schemastore.nvim", "jose-elias-alvarez/typescript.nvim", "mfussenegger/nvim-jdtls",
      "folke/neodev.nvim" },
  },
  {
    "b0o/schemastore.nvim"
  },
  {
    'echasnovski/mini.completion',
    version = false,
    enabled = false,
    opts = {
      -- Delay (debounce type, in ms) between certain Neovim event and action.
      -- This can be used to (virtually) disable certain automatic actions by
      -- setting very high delay time (like 10^7).
      delay = { completion = 100, info = 100, signature = 50 },
      -- Configuration for action windows:
      -- - `height` and `width` are maximum dimensions.
      -- - `border` defines border (as in `nvim_open_win()`).
      window = {
        info = { height = 25, width = 80, border = 'none' },
        signature = { height = 25, width = 80, border = 'none' },
      },
      -- Way of how module does LSP completion
      lsp_completion = {
        -- `source_func` should be one of 'completefunc' or 'omnifunc'.
        source_func = 'omnifunc',
        -- `auto_setup` should be boolean indicating if LSP completion is set up
        -- on every `BufEnter` event.
        auto_setup = true,
        -- `process_items` should be a function which takes LSP
        -- 'textDocument/completion' response items and word to complete. Its
        -- output should be a table of the same nature as input items. The most
        -- common use-cases are custom filtering and sorting. You can use
        -- default `process_items` as `MiniCompletion.default_process_items()`.
        -- process_items = --<function: filters out snippets; sorts by LSP specs>,
      },
      -- Fallback action. It will always be run in Insert mode. To use Neovim's
      -- built-in completion (see `:h ins-completion`), supply its mapping as
      -- string. Example: to use 'whole lines' completion, supply '<C-x><C-l>'.
      -- fallback_action = --<function: like `<C-n>` completion>,

      -- Module mappings. Use `''` (empty string) to disable one. Some of them
      -- might conflict with system mappings.
      mappings = {
        force_twostep = '<C-Space>',  -- Force two-step completion
        force_fallback = '<A-Space>', -- Force fallback completion
      },
      -- Whether to set Vim's settings for better experience (modifies
      -- `shortmess` and `completeopt`)
      set_vim_settings = true,
    },
    config = function(_, opts)
      require('mini.completion').setup(opts)
    end
  },
  {
    "rmagatti/goto-preview",
    keys = {
      { "gp", desc = "Goto Preview" },
    },
    opts = {
      width = 120,                                         -- Width of the floating window
      height = 15,                                         -- Height of the floating window
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
      default_mappings = false,                            -- Bind default mappings
      debug = false,                                       -- Print debug information
      opacity = nil,                                       -- 0-100 opacity level of the floating window where 100 is fully transparent.
      resizing_mappings = false,                           -- Binds arrow keys to resizing the floating window.
      post_open_hook = nil,                                -- A function taking two arguments, a buffer and a window to be ran as a hook.
      -- references = { -- Configure the telescope UI for slowing the references cycling window.
      --     telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
      -- },
      -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
      focus_on_open = true,                                        -- Focus the floating window when opening it.
      dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
      force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
      stack_floating_preview_windows = true,                       -- Whether to nest floating windows
      preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
    },
    config = function()
      require("goto-preview").setup()
      require("config.keymaps").goto_preview_setup()
    end
  },
  {
    -- linting
    "mfussenegger/nvim-lint",
    config = function()
      require('lint').linters_by_ft = {
        typescriptreact = { 'eslint_d', },
        javascript = { 'eslint_d', },
        typescript = { 'eslint_d', }
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },
  {
    -- show lsp progress
    "j-hui/fidget.nvim",
    opts = {},
    config = function(_, opts)
      require "fidget".setup(opts)
    end
  },
  {
    "dnlhc/glance.nvim",
    opts = function()
      local actions = require("glance").actions

      return {
        height = 18, -- Height of the window
        zindex = 45,
        -- By default glance will open preview "embedded" within your active window
        -- when `detached` is enabled, glance will render above all existing windows
        -- and won't be restiricted by the width of your active window
        detached = true,
        -- Or use a function to enable `detached` only when the active window is too small
        -- (default behavior)
        -- detached = function(winid)
        --   return vim.api.nvim_win_get_width(winid) < 100
        -- end,
        preview_win_opts = {
          -- Configure preview window options
          cursorline = true,
          number = true,
          wrap = true,
        },
        border = {
          enable = false, -- Show window borders. Only horizontal borders allowed
          top_char = '―',
          bottom_char = '―',
        },
        list = {
          position = 'right', -- Position of the list window 'left'|'right'
          width = 0.33,       -- 33% width relative to the active window, min 0.1, max 0.5
        },
        theme = {
          -- This feature might not work properly in nvim-0.7.2
          enable = true, -- Will generate colors for the plugin based on your current colorscheme
          mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
        },
        mappings = {
          list = {
            ['j'] = actions.next,     -- Bring the cursor to the next item in the list
            ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
            ['<Down>'] = actions.next,
            ['<Up>'] = actions.previous,
            ['<Tab>'] = actions.next_location,       -- Bring the cursor to the next location skipping groups in the list
            ['<S-Tab>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
            ['<C-u>'] = actions.preview_scroll_win(5),
            ['<C-d>'] = actions.preview_scroll_win(-5),
            ['v'] = actions.jump_vsplit,
            ['s'] = actions.jump_split,
            ['t'] = actions.jump_tab,
            ['<CR>'] = actions.jump,
            ['o'] = actions.jump,
            ['<leader>l'] = actions.enter_win('preview'), -- Focus preview window
            ['q'] = actions.close,
            ['Q'] = actions.close,
            ['<Esc>'] = actions.close,
            ["<C-q>"] = actions.quickfix,
            -- ['<Esc>'] = false -- disable a mapping
          },
          preview = {
            ['Q'] = actions.close,
            ['<Tab>'] = actions.next_location,
            ['<S-Tab>'] = actions.previous_location,
            ['<leader>l'] = actions.enter_win('list'), -- Focus list window
          },
        },
        hooks = {
          before_open = function(results, open, jump, method)
            local uri = vim.uri_from_bufnr(0)
            if #results == 1 then
              local target_uri = results[1].uri or results[1].targetUri

              if target_uri == uri then
                jump(results[1])
              else
                open(results)
              end
            else
              open(results)
            end
          end,
        },
        folds = {
          fold_closed = '',
          fold_open = '',
          folded = true, -- Automatically fold list on startup
        },
        indent_lines = {
          enable = true,
          icon = '│',
        },
        winbar = {
          enable = true, -- Available strating from nvim-0.8+
        },
      }
    end
  },
  {
    -- snippets
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "1.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    config = function(_, opts)
      require("luasnip").setup(opts)

      -- local snippets_folder = vim.fn.stdpath "config" .. "/lua/plugins/completion/snippets/"
      -- require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }

      -- vim.api.nvim_create_user_command("LuaSnipEdit", function()
      --   require("luasnip.loaders.from_lua").edit_snippet_files()
      -- end, {})
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    enabled = false,
    opts = {
      input_buffer_type = "dressing",
    }
  },
  {
    "kosayoda/nvim-lightbulb",
    opts = {
      -- LSP client names to ignore
      -- Example: {"sumneko_lua", "null-ls"}
      ignore = {},
      sign = {
        enabled = false,
        -- Priority of the gutter sign
        priority = 10,
      },
      float = {
        enabled = true,
        -- Text to show in the popup float
        text = "💡",
        -- Available keys for window options:
        -- - height     of floating window
        -- - width      of floating window
        -- - wrap_at    character to wrap at for computing height
        -- - max_width  maximal width of floating window
        -- - max_height maximal height of floating window
        -- - pad_left   number of columns to pad contents at left
        -- - pad_right  number of columns to pad contents at right
        -- - pad_top    number of lines to pad contents at top
        -- - pad_bottom number of lines to pad contents at bottom
        -- - offset_x   x-axis offset of the floating window
        -- - offset_y   y-axis offset of the floating window
        -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
        -- - winblend   transparency of the window (0-100)
        win_opts = {},
      },
      virtual_text = {
        enabled = false,
        -- Text to show at virtual text
        text = "💡",
        -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
        hl_mode = "replace",
      },
      status_text = {
        enabled = false,
        -- Text to provide when code actions are available
        text = "💡",
        -- Text to provide when no actions are available
        text_unavailable = ""
      },
      autocmd = {
        enabled = true,
        -- see :help autocmd-pattern
        pattern = { "*" },
        -- see :help autocmd-events
        events = { "CursorHold", "CursorHoldI" }
      }
    }
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    opts = function()
      local path = require("plenary.path")
      return {
        -- The directory in which to install packages.
        install_root_dir = vim.fn.stdpath "data" .. "/mason",
        -- Where Mason should put its bin location in your PATH. Can be one of:
        -- - "prepend" (default, Mason's bin location is put first in PATH)
        -- - "append" (Mason's bin location is put at the end of PATH)
        -- - "skip" (doesn't modify PATH)
        ---@type '"prepend"' | '"append"' | '"skip"'
        PATH = "prepend",
        -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
        -- debugging issues with package installations.
        log_level = vim.log.levels.INFO,
        -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
        -- packages that are requested to be installed will be put in a queue.
        max_concurrent_installers = 4,
        -- [Advanced setting]
        -- The registries to source packages from. Accepts multiple entries. Should a package with the same name exist in
        -- multiple registries, the registry listed first will be used.
        registries = {
          "github:mason-org/mason-registry",
        },
        -- The provider implementations to use for resolving supplementary package metadata (e.g., all available versions).
        -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
        -- Builtin providers are:
        --   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
        --   - mason.providers.client        - uses only client-side tooling to resolve metadata
        providers = {
          "mason.providers.registry-api",
          "mason.providers.client",
        },
        github = {
          -- The template URL to use when downloading assets from GitHub.
          -- The placeholders are the following (in order):
          -- 1. The repository (e.g. "rust-lang/rust-analyzer")
          -- 2. The release version (e.g. "v0.3.0")
          -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
          download_url_template = "https://github.com/%s/releases/download/%s/%s",
        },
        pip = {
          -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
          upgrade_pip = false,
          -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
          -- and is not recommended.
          --
          -- Example: { "--proxy", "https://proxyserver" }
          install_args = {},
        },
        ui = {
          -- Whether to automatically check for new versions when opening the :Mason window.
          check_outdated_packages_on_open = true,
          -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
          border = "none",
          -- Width of the window. Accepts:
          -- - Integer greater than 1 for fixed width.
          -- - Float in the range of 0-1 for a percentage of screen width.
          width = 0.8,
          -- Height of the window. Accepts:
          -- - Integer greater than 1 for fixed height.
          -- - Float in the range of 0-1 for a percentage of screen height.
          height = 0.9,
          icons = {
            -- The list icon to use for installed packages.
            package_installed = "◍",
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = "◍",
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "◍",
          },
          keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
          },
        },
      }
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettierd,
          -- nls.builtins.code_actions.gitsigns,
          nls.builtins.code_actions.eslint_d,
          -- require("typescript.extensions.null-ls.code-actions"),
        },
      }
    end,
  },
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require('hover.providers.gh')
          require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = nil
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true
      }
    end
  }
}
