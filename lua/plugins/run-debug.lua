return {
  {
    'kndndrj/nvim-projector',
    dependencies = {
      -- Install the ones you want (I recommend all)
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'tpope/vim-dadbod',
      'kristijanhusak/vim-dadbod-ui',
      -- Devicons are also supported:
      'nvim-tree/nvim-web-devicons',
      -- Any extra extensions that you want:
      'kndndrj/projector-loader-vscode',
    },
    config = function()
      local config = {
        -- array of loader names with parameters
        -- for available loaders and their options see "Loaders" section in README.md
        loaders = {
          {
            module = "builtin",
            options = {
              path = vim.fn.getcwd() .. "/.vim/projector.json",
              configs = nil,
            },
          },
          {
            module = "dap",
            options = nil,
          },
          {
            module = 'idea',
            options = {
              path  = vim.fn.getcwd() .. "/.idea/workspace.xml"
            }
          }
        },
        -- map of outputs per mode
        -- for available outputs and their options see "Outputs" section in README.md
        outputs = {
          task = {
            module = "builtin",
            options = nil,
          },
          debug = {
            module = "dap",
            options = nil,
          },
          database = {
            module = "dadbod",
            options = nil,
          },
        },
        -- function that formats the task selector output
        display_format = function(loader, scope, group, modes, name)
          return loader .. "  " .. scope .. "  " .. group .. "  " .. modes .. "  " .. name
        end,
        -- Reload configurations automatically before displaying task selector
        automatic_reload = false,
        -- map of icons
        -- NOTE: "groups" use nvim-web-devicons if available
        icons = {
          enable = true,
          scopes = {
            global = "",
            project = "",
          },
          groups = {},
          loaders = {},
          modes = {
            task = "",
            debug = "",
            database = ""
          },
        },
      }
      require 'projector'.setup(config)
    end
  }
}
