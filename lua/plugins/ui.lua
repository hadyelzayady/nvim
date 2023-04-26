return {
    {
        --Create Color Code in neovim and colorizer
        "uga-rosa/ccc.nvim",
        opts = function()
          local ccc = require("ccc")
          return {
              pickers = {
                  ccc.picker.hex,
                  ccc.picker.css_rgb,
                  ccc.picker.css_hsl,
                  ccc.picker.css_hwb,
                  ccc.picker.css_lab,
                  ccc.picker.css_lch,
                  ccc.picker.css_oklab,
                  ccc.picker.css_oklch,
                  ccc.picker.css_name
              }
          }
        end
    },
    {
        -- better quickfix
        { "kevinhwang91/nvim-bqf",
            dependencies = {
                {
                    "junegunn/fzf",
                    build = function()
                      vim.fn['fzf#install']()
                    end
                }
            }
        }

    },
    {
        's1n7ax/nvim-window-picker',
        version = 'v1.*',
        opts = {
            -- when there is only one window available to pick from, use that window
            -- without prompting the user to select
            autoselect_one = true,

            -- whether you want to include the window you are currently on to window
            -- selection or not
            include_current_win = false,

            -- when you go to window selection mode, status bar will show one of
            -- following letters on them so you can use that letter to select the window
            selection_chars = 'FJDKSLA;CMRUEIWOQP',

            -- whether you want to use winbar instead of the statusline
            -- "always" means to always use winbar,
            -- "never" means to never use winbar
            -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
            use_winbar = 'never', -- "always" | "never" | "smart"

            -- whether to show 'Pick window:' prompt
            show_prompt = true,

            -- if you want to manually filter out the windows, pass in a function that
            -- takes two parameters. you should return window ids that should be
            -- included in the selection
            -- EX:-
            -- function(window_ids, filters)
            --    -- filter the window_ids
            --    -- return only the ones you want to include
            --    return {1000, 1001}
            -- end
            filter_func = nil,

            -- following filters are only applied when you are using the default filter
            -- defined by this plugin. if you pass in a function to "filter_func"
            -- property, you are on your own
            filter_rules = {
                -- filter using buffer options
                bo = {
                    -- if the file type is one of following, the window will be ignored
                    filetype = { 'NvimTree', "neo-tree", "notify" },

                    -- if the buffer type is one of following, the window will be ignored
                    buftype = { 'terminal' },
                },

                -- filter using window options
                wo = {},

                -- if the file path contains one of following names, the window
                -- will be ignored
                file_path_contains = {},

                -- if the file name contains one of following names, the window will be
                -- ignored
                file_name_contains = {},
            },

            -- the foreground (text) color of the picker
            fg_color = '#ededed',

            -- if you have include_current_win == true, then current_win_hl_color will
            -- be highlighted using this background color
            current_win_hl_color = '#e35e4f',

            -- all the windows except the curren window will be highlighted using this
            -- color
            other_win_hl_color = '#44cc41',

            -- You can change the display string in status bar.
            -- It supports '%' printf style. Such as `return char .. ': %f'` to display
            -- buffer filepath. See :h 'stl' for details.
            selection_display = function(char) return char end,
        },
        config = function(_, opts)
          require 'window-picker'.setup(opts)
        end,
    },
    {
        -- better search
        'kevinhwang91/nvim-hlslens',
        config = function()
          require('hlslens').setup()
          require('config.keymaps').hlslens_setup()
        end
    },
    {
        "stevearc/dressing.nvim",
        opts = {
            input = {
                -- Set to false to disable the vim.ui.input implementation
                enabled = true,

                -- Default prompt string
                default_prompt = "Input:",

                -- Can be 'left', 'right', or 'center'
                title_pos = "left",

                -- When true, <Esc> will close the modal
                insert_only = true,

                -- When true, input will start in insert mode.
                start_in_insert = true,

                -- These are passed to nvim_open_win
                anchor = "SW",
                border = "rounded",
                -- 'editor' and 'win' will default to being centered
                relative = "cursor",

                -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                prefer_width = 40,
                width = nil,
                -- min_width and max_width can be a list of mixed types.
                -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
                max_width = { 140, 0.9 },
                min_width = { 20, 0.2 },

                buf_options = {},
                win_options = {
                    -- Window transparency (0-100)
                    winblend = 10,
                    -- Disable line wrapping
                    wrap = false,
                    -- Indicator for when text exceeds window
                    list = true,
                    listchars = "precedes:…,extends:…",
                    -- Increase this for more context when text scrolls off the window
                    sidescrolloff = 0,
                },

                -- Set to `false` to disable
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                    i = {
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext",
                    },
                },

                override = function(conf)
                  -- This is the config that will be passed to nvim_open_win.
                  -- Change values here to customize the layout
                  return conf
                end,

                -- see :help dressing_get_config
                get_config = nil,
            },
            select = {
                -- Set to false to disable the vim.ui.select implementation
                enabled = true,

                -- Priority list of preferred vim.select implementations
                backend = { "fzf_lua", "telescope", "fzf", "builtin", "nui" },

                -- Trim trailing `:` from prompt
                trim_prompt = true,

                -- Options for telescope selector
                -- These are passed into the telescope picker directly. Can be used like:
                -- telescope = require('telescope.themes').get_ivy({...})
                telescope = nil,

                -- Options for fzf selector
                fzf = {
                    window = {
                        width = 0.3,
                        height = 0.3,
                    },
                },

                -- Options for nui Menu
                nui = {
                    position = "50%",
                    size = nil,
                    relative = "editor",
                    border = {
                        style = "rounded",
                    },
                    buf_options = {
                        swapfile = false,
                        filetype = "DressingSelect",
                    },
                    win_options = {
                        winblend = 10,
                    },
                    max_width = 80,
                    max_height = 40,
                    min_width = 40,
                    min_height = 10,
                },

                -- Options for built-in selector
                builtin = {
                    -- These are passed to nvim_open_win
                    anchor = "NW",
                    border = "rounded",
                    -- 'editor' and 'win' will default to being centered
                    relative = "editor",

                    buf_options = {},
                    win_options = {
                        -- Window transparency (0-100)
                        winblend = 10,
                    },

                    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- the min_ and max_ options can be a list of mixed types.
                    -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
                    width = nil,
                    max_width = { 140, 0.8 },
                    min_width = { 40, 0.2 },
                    height = nil,
                    max_height = 0.9,
                    min_height = { 10, 0.2 },

                    -- Set to `false` to disable
                    mappings = {
                        ["<Esc>"] = "Close",
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },

                    override = function(conf)
                      -- This is the config that will be passed to nvim_open_win.
                      -- Change values here to customize the layout
                      return conf
                    end,
                },

                -- Used to override format_item. See :help dressing-format
                format_item_override = {},

                -- see :help dressing_get_config
                get_config = nil,
            },
        }
    },
    {
        "folke/trouble.nvim",
        opts = {
            position = "bottom", -- position of the list can be: bottom, top, left, right
            height = 10, -- height of the trouble list when position is top or bottom
            width = 50, -- width of the list when position is left or right
            icons = true, -- use devicons for filenames
            mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
            fold_open = "", -- icon used for open folds
            fold_closed = "", -- icon used for closed folds
            group = true, -- group results by file
            padding = true, -- add an extra new line on top of the list
            action_keys = { -- key mappings for actions in the trouble list
                -- map to {} to remove a mapping, for example:
                -- close = {},
                close = "q", -- close the list
                cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                refresh = "r", -- manually refresh
                jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
                open_split = { "<c-x>" }, -- open buffer in new split
                open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                open_tab = { "<c-t>" }, -- open buffer in new tab
                jump_close = { "o" }, -- jump to the diagnostic and close the list
                toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                toggle_preview = "P", -- toggle auto_preview
                hover = "K", -- opens a small popup with the full multiline message
                preview = "p", -- preview the diagnostic location
                close_folds = { "zM", "zm" }, -- close all folds
                open_folds = { "zR", "zr" }, -- open all folds
                toggle_fold = { "zA", "za" }, -- toggle fold of current file
                previous = "k", -- previous item
                next = "j" -- next item
            },
            indent_lines = true, -- add an indent guide below the fold icons
            auto_open = false, -- automatically open the list when you have diagnostics
            auto_close = false, -- automatically close the list when you have no diagnostics
            auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
            auto_fold = false, -- automatically fold a file trouble list at creation
            auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
            signs = {
                -- icons / text used for a diagnostic
                error = require("utils.ui-components").icons.diagnostics.Error,
                warning = require("utils.ui-components").icons.diagnostics.Warn,
                hint = require("utils.ui-components").icons.diagnostics.Hint,
                information = require("utils.ui-components").icons.diagnostics.Info,
                other = "﫠"
            },
            use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
        } }
}
