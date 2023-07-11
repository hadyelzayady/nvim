---@diagnostic disable: undefined-field
---@class FileMovedArgs
---@field source string
---@field destination string

---@param args FileMovedArgs
local function on_file_remove(args)
  local ts_clients = vim.lsp.get_active_clients({ name = "typescript-tools" })
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree reveal=true toggle=true<cr>", desc = "File Explorer Reveal" },
      { "<leader>E", "<cmd>Neotree toggle=true<cr>",             desc = "File Explorer" }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      -- If a user has a sources list it will replace this one.
      -- Only sources listed here will be loaded.
      -- You can also add an external source by adding it's name to this list.
      -- The name used here must be the same name you would use in a require() call.
      sources = {
        "filesystem",
        "buffers",
        "git_status",
      },
      add_blank_line_at_top = false,           -- Add a blank line at the top of the tree.
      auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions
      close_if_last_window = false,            -- Close Neo-tree if it is the last window left in the tab
      -- popup_border_style is for input and confirmation dialogs.
      -- Configurtaion of floating window is done in the individual source sections.
      -- "NC" is a special style that works well with NormalNC set
      close_floats_on_escape_key = true,
      default_source = "filesystem",
      enable_diagnostics = true,
      enable_git_status = true,
      enable_modified_markers = true, -- Show markers for files with unsaved changes.
      enable_opened_markers = true,   -- Enable tracking of opened files. Required for `components.name.highlight_opened_files`
      enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
      git_status_async = true,
      -- These options are for people with VERY large git repos
      git_status_async_options = {
        batch_size = 1000, -- how many lines of git status results to process at a time
        batch_delay = 10,  -- delay in ms between batches. Spreads out the workload to let other processes run.
        max_lines = 10000, -- How many lines of git status results to process. Anything after this will be dropped.
        -- Anything before this will be used. The last items to be processed are the untracked files.
      },
      hide_root_node = false,                                            -- Hide the root node.
      retain_hidden_root_indent = false,                                 -- IF the root node is hidden, keep the indentation anyhow.
      -- This is needed if you use expanders because they render in the indent.
      log_level = "info",                                                -- "trace", "debug", "info", "warn", "error", "fatal"
      log_to_file = false,                                               -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
      open_files_in_last_window = true,                                  -- false = open files in top left window
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
      popup_border_style = "NC",                                         -- "double", "none", "rounded", "shadow", "single" or "solid"
      resize_timer_interval = 500,                                       -- in ms, needed for containers to redraw right aligned and faded content
      -- set to -1 to disable the resize timer entirely
      --                           -- NOTE: this will speed up to 50 ms for 1 second following a resize
      sort_case_insensitive = false, -- used when sorting files and directories in the tree
      sort_function = nil,           -- uses a custom function for sorting files and directories in the tree
      use_popups_for_input = true,   -- If false, inputs will use vim.ui.input() instead of custom floats.
      use_default_mappings = true,
      -- source_selector provides clickable tabs to switch between sources.
      source_selector = {
        winbar = true,                         -- toggle to show selector on winbar
        statusline = false,                    -- toggle to show selector on statusline
        show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
        -- of the top visible node when scrolled down.
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
          { source = "document_symbols" }
        },
        content_layout = "start", -- only with `tabs_layout` = "equal", "focus"
        --                start  : |/ 裡 bufname     \/...
        --                end    : |/     裡 bufname \/...
        --                center : |/   裡 bufname   \/...
        tabs_layout = "equal", -- start, end, center, equal, focus
        --             start  : |/  a  \/  b  \/  c  \            |
        --             end    : |            /  a  \/  b  \/  c  \|
        --             center : |      /  a  \/  b  \/  c  \      |
        --             equal  : |/    a    \/    b    \/    c    \|
        --             active : |/  focused tab    \/  b  \/  c  \|
        truncation_character = "…", -- character to use when truncating the tab label
        tabs_min_width = nil,       -- nil | int: if int padding is added based on `content_layout`
        tabs_max_width = nil,       -- this will truncate text even if `text_trunc_to_fit = false`
        padding = 0,                -- can be int or table
        -- padding = { left = 2, right = 0 },
        -- separator = "▕", -- can be string or table, see below
        separator = { left = "▏", right = "▕" },
        -- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
        -- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
        -- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
        -- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
        -- separator = "|",                                              -- ||  a  |  b  |  c  |...
        separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
        show_separator_on_edge = false,
        --                       true  : |/    a    \/    b    \/    c    \|
        --                       false : |     a    \/    b    \/    c     |
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",
      },
      --
      event_handlers = {
        --  {
        --    event = "before_render",
        --    handler = function (state)
        --      -- add something to the state that can be used by custom components
        --    end
        --  },
        --  {
        --    event = "file_opened",
        --    handler = function(file_path)
        --      --auto close
        --      require("neo-tree").close_all()
        --    end
        --  },
        --  {
        --    event = "file_opened",
        --    handler = function(file_path)
        --      --clear search after opening a file
        --      require("neo-tree.sources.filesystem").reset_search()
        --    end
        --  },
        {
          event = "file_renamed",
          handler = on_file_remove
        },
        {
          event = "file_moved",
          handler = on_file_remove
        },
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.wo.number = true
            vim.wo.relativenumber = true
            vim.cmd 'highlight! Cursor blend=100'
          end
        },
        --  {
        --    event = "neo_tree_buffer_leave",
        --    handler = function()
        --      vim.cmd 'highlight! Cursor guibg=#5f87af blend=0'
        --    end
        --  },
        -- {
        --   event = "neo_tree_window_before_open",
        --   handler = function(args)
        --     print("neo_tree_window_before_open", vim.inspect(args))
        --   end
        -- },
        -- {
        --   event = "neo_tree_window_after_open",
        --   handler = function(args)
        --     vim.cmd("wincmd =")
        --   end
        -- },
        -- {
        --   event = "neo_tree_window_before_close",
        --   handler = function(args)
        --     print("neo_tree_window_before_close", vim.inspect(args))
        --   end
        -- },
        -- {
        --   event = "neo_tree_window_after_close",
        --   handler = function(args)
        --     vim.cmd("wincmd =")
        --   end
        -- }
      },
      default_component_configs = {
        container = {
          enable_character_fade = true,
          width = "100%",
          right_padding = 0,
        },
        diagnostics = {
          symbols = {
            hint = require("utils.ui-components").icons.diagnostics.Hint,
            info = require("utils.ui-components").icons.diagnostics.Info,
            warn = require("utils.ui-components").icons.diagnostics.Warn,
            error = require("utils.ui-components").icons.diagnostics.Error,
          },
          highlights = {
            hint = "DiagnosticSignHint",
            info = "DiagnosticSignInfo",
            warn = "DiagnosticSignWarn",
            error = "DiagnosticSignError",
          },
        },
        indent = {
          indent_size = 2,
          padding = 1,
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = "*",
          highlight = "NeoTreeFileIcon"
        },
        modified = {
          symbol = "[+] ",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          highlight_opened_files = false, -- Requires `enable_opened_markers = true`.
          -- Take values in { false (no highlight), true (only loaded),
          -- "all" (both loaded and unloaded)}. For more information,
          -- see the `show_unloaded` config of the `buffers` source.
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            -- Change type
            added     = require("utils.ui-components").icons.git.added, -- NOTE: you can set any of these to an empty string to not show them
            deleted   = require("utils.ui-components").icons.git.deleted,
            modified  = require("utils.ui-components").icons.git.modified,
            renamed   = require("utils.ui-components").icons.git.renamed,
            -- Status type
            untracked = require("utils.ui-components").icons.git.untracked,
            ignored   = require("utils.ui-components").icons.git.ignored,
            unstaged  = require("utils.ui-components").icons.git.unstaged,
            staged    = require("utils.ui-components").icons.git.staged,
            conflict  = require("utils.ui-components").icons.git.conflict,
          },
          align = "right",
        },
      },
      renderers = {
        directory = {
          { "indent" },
          { "icon" },
          { "current_filter" },
          {
            "container",
            content = {
              { "name",        zindex = 10 },
              -- {
              --   "symlink_target",
              --   zindex = 10,
              --   highlight = "NeoTreeSymbolicLinkTarget",
              -- },
              { "clipboard",   zindex = 10 },
              { "diagnostics", errors_only = true, zindex = 20,     align = "right",          hide_when_expanded = true },
              { "git_status",  zindex = 20,        align = "right", hide_when_expanded = true },
            },
          },
        },
        message = {
          { "indent", with_markers = false },
          { "name",   highlight = "NeoTreeMessage" },
        },
        terminal = {
          { "indent" },
          { "icon" },
          { "name" },
          { "bufnr" }
        }
      },
      nesting_rules = {},
      -- Global custom commands that will be available in all sources (if not overridden in `opts[source_name].commands`)
      --
      -- You can then reference the custom command by adding a mapping to it:
      --    globally    -> `opts.window.mappings`
      --    locally     -> `opt[source_name].window.mappings` to make it source specific.
      --
      -- commands = {              |  window {                 |  filesystem {
      --   hello = function()      |    mappings = {           |    commands = {
      --     print("Hello world")  |      ["<C-c>"] = "hello"  |      hello = function()
      --   end                     |    }                      |        print("Hello world in filesystem")
      -- }                         |  }                        |      end
      --
      -- see `:h neo-tree-global-custom-commands`
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- macOs: open file in default application in the background.
          -- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
          vim.api.nvim_command("silent !open " .. '"' .. path .. '"')
        end,
        copy_to_system_clipboard = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- macOs: open file in default application in the background.
          -- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
          os.execute("echo " .. path .. " | pbcopy")
        end,
        paste_from_system_clipboard = function(state)
          local file_path = require('utils.functions').os_capture("pbpaste")
          local node = state.tree:get_node()
          local parent_path = node:get_parent_id()
          os.execute("cp -rf " .. file_path .. " " .. parent_path)
          vim.cmd("Neotree show")
        end,
        diff_files = function(state)
          local node = state.tree:get_node()
          local log = require("neo-tree.log")
          state.clipboard = state.clipboard or {}
          if diff_Node and diff_Node ~= tostring(node.id) then
            local current_Diff = node.id
            require("neo-tree.utils").open_file(state, diff_Node, open)
            vim.cmd("vert diffs " .. current_Diff)
            log.info("Diffing " .. diff_Name .. " against " .. node.name)
            diff_Node = nil
            current_Diff = nil
            state.clipboard = {}
            require("neo-tree.ui.renderer").redraw(state)
          else
            local existing = state.clipboard[node.id]
            if existing and existing.action == "diff" then
              state.clipboard[node.id] = nil
              diff_Node = nil
              require("neo-tree.ui.renderer").redraw(state)
            else
              state.clipboard[node.id] = { action = "diff", node = node }
              diff_Name = state.clipboard[node.id].node.name
              diff_Node = tostring(state.clipboard[node.id].node.id)
              log.info("Diff source file " .. diff_Name)
              require("neo-tree.ui.renderer").redraw(state)
            end
          end
        end,
        git_diff_file = function(state)
          local node = state.tree:get_node()
          local file = node:get_id()
          vim.cmd("DiffviewOpen -- " .. file)
        end,
        git_diff = function()
          vim.cmd("DiffviewOpen")
        end
      }, -- A list of functions
      window = {
        -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
        -- possible options. These can also be functions that return these options.
        position = "left",         -- left, right, top, bottom, float, current
        width = 40,                -- applies to left and right positions
        height = 15,               -- applies to top and bottom positions
        auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
        popup = {
          -- settings that apply to float position only
          size = {
            height = "80%",
            width = "50%",
          },
          position = "50%", -- 50% means center it
          -- you can also specify border here, if you want a different setting from
          -- the global popup_border_style.
        },
        same_level = false,  -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
        insert_as = "child", -- Affects how nodes get inserted into the tree during creation/pasting/moving of files if the node under the cursor is a directory:
        -- "child":   Insert nodes as children of the directory under cursor.
        -- "sibling": Insert nodes  as siblings of the directory under cursor.
        -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
        -- You can also create your own commands by providing a function instead of a string.
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['b']             = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
          ['i']             = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,

          ['<space>d']      = 'diff_files',
          ["<space>"]       = {
            "toggle_node",
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"]          = "open",
          ["<esc>"]         = "revert_preview",
          ["P"]             = { "toggle_preview", config = { use_float = true } },
          ["l"]             = "focus_preview",
          ["S"]             = "open_split",
          -- ["S"] = "split_with_window_picker",
          ["s"]             = "open_vsplit",
          -- ["s"] = "vsplit_with_window_picker",
          ["t"]             = "open_tabnew",
          -- ["<cr>"] = "open_drop",
          -- ["t"] = "open_tab_drop",
          ["w"]             = "open_with_window_picker",
          ["C"]             = "close_node",
          ["z"]             = "close_all_nodes",
          --["Z"] = "expand_all_nodes",
          ["R"]             = "refresh",
          ["a"]             = {
            "add",
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none", -- "none", "relative", "absolute"
            }
          },
          ["A"]             = "add_directory", -- also accepts the config.show_path and config.insert_as options.
          ["d"]             = "delete",
          ["r"]             = "rename",
          ["y"]             = "copy_to_clipboard",
          ["x"]             = "cut_to_clipboard",
          ["p"]             = "paste_from_clipboard",
          ["c"]             = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
          ["m"]             = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
          ["e"]             = "toggle_auto_expand_width",
          ["q"]             = "close_window",
          ["?"]             = "show_help",
          ["<"]             = "prev_source",
          [">"]             = "next_source",
        },
      },
      filesystem = {
        display_name = " Files",
        components = {
          harpoon_index = function(config, node)
            local Marked = require("harpoon.mark")
            local path = node:get_id()
            local succuss, index = pcall(Marked.get_index_of, path)
            if succuss and index and index > 0 then
              return {
                text = string.format(" ⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
                highlight = config.highlight or "NeoTreeDirectoryIcon",
              }
            else
              return {}
            end
          end
        },
        renderers = {
          file = {
            { "indent" },
            { "icon" },
            {
              "container",
              content = {
                {
                  "name",
                  zindex = 10
                },
                { "clipboard",     zindex = 10 },
                { "harpoon_index", zindex = 10 }, --> This is what actually adds the component in where you want it
                { "modified",      zindex = 20, align = "right" },
                { "diagnostics",   zindex = 20, align = "right" },
                { "git_status",    zindex = 20, align = "right" },
              },
            },

          }
        },

        window = {
          mappings = {
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            --["/"] = "filter_as_you_type", -- this was the default until v1.28
            ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
            -- ["D"] = "fuzzy_sorter_directory",
            ["f"] = "filter_on_submit",
            ["<C-x>"] = "clear_filter",
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
            ["<space>y"] = "copy_to_system_clipboard",
            ["<space>p"] = "paste_from_system_clipboard",
            ["o"] = "system_open",
          },
          fuzzy_finder_mappings = {
            -- define keymaps for filter popup window in fuzzy_finder_mode
            ["<down>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
          },
        },
        async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
        -- "always" means directory scans are always async.
        -- "never"  means directory scans are never async.
        scan_mode = "deep",  -- "shallow": Don't scan into directories to detect possible empty directory a priori
        -- "deep": Scan into directories to detect empty or grouped empty directories a priori.
        bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        cwd_target = {
          sidebar = "tab",   -- sidebar is when position = left or right
          current = "window" -- current is when position = current
        },
        -- The renderer section provides the renderers that will be used to render the tree.
        --   The first level is the node type.
        --   For each node type, you can specify a list of components to render.
        --       Components are rendered in the order they are specified.
        --         The first field in each component is the name of the function to call.
        --         The rest of the fields are passed to the function as the "config" argument.
        filtered_items = {
          visible = false,                       -- when true, they will just be displayed differently than normal items
          force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
          show_hidden_count = true,              -- when true, the number of hidden items in each folder will be shown as the last entry
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            ".DS_Store",
            "thumbs.db"
            --"node_modules",
          },
          hide_by_pattern = { -- uses glob style patterns
            --"*.meta",
            --"*/src/*/tsconfig.json"
          },
          always_show = { -- remains visible even if other settings would normally hide it
            --".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            --".DS_Store",
            --"thumbs.db"
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
        find_by_full_path_words = false,        -- `false` means it only searches the tail of a path.
        group_empty_dirs = true,                -- when true, empty folders will be grouped together
        search_limit = 50,                      -- max number of search results when using filters
        follow_current_file = true,             -- This will find and focus the file in the active buffer every time
        -- the current file is changed while the tree is open.
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",-- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
      },
      buffers = {
        display_name = " Buffers",
        bind_to_cwd = true,
        follow_current_file = true, -- This will find and focus the file in the active buffer every time
        -- the current file is changed while the tree is open.
        group_empty_dirs = true,    -- when true, empty directories will be grouped together
        show_unloaded = false,      -- When working with sessions, for example, restored but unfocused buffers
        -- are mark as "unloaded". Turn this on to view these unloaded buffer.
        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["bd"] = "buffer_delete",
          },
        },
      },
      git_status = {
        display_name = "󰊢 Git",
        window = {
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
            ["d"] = "git_diff_file",
            ["D"] = "git_diff"
          },
        },
      },
      example = {
        renderers = {
          custom = {
            { "indent" },
            { "icon",  default = "C" },
            { "custom" },
            { "name" }
          }
        },
        window = {
          mappings = {
            ["<cr>"] = "toggle_node",
            ["<C-e>"] = "example_command",
            ["d"] = "show_debug_info",
          },
        },
      },
    }
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    keys = {
      '-'
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      require("oil").setup(opts)
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end

  }
}
