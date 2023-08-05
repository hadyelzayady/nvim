return function()
  local telescopeConfig = require("telescope.config")
  local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

  local trouble = require("trouble.providers.telescope")
  return {
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      vimgrep_arguments = vimgrep_arguments,
      -- path_display = { 'smart' },
      dynamic_preview_title = true,
      mappings = {
        i = {
          ["<C-Down>"] = require('telescope.actions').cycle_history_next,
          ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key",
          -- ["<c-t>"] = trouble.open_with_trouble
        },
        -- n = { ["<c-t>"] = trouble.open_with_trouble },
      },
      file_ignore_patterns = { "node_modules" },
    },
    pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
      git_files = {
        show_untracked = true
      },
      git_branches = {
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            -- ["<C-d>"] = function(args, arg2)
            --   print(args, arg2)
            -- end,
          },
        },
      }
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
      projects = {},
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  }
end
