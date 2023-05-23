---@diagnostic disable: undefined-field
return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require('dap')
      vim.api.nvim_create_user_command("DapUiToggle", function()
        require("dapui").toggle()
      end, {})

      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/local/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
      }
      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Adapters                                                 │
      -- ╰──────────────────────────────────────────────────────────╯
      -- NODE
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
      }

      -- Chrome
      dap.adapters.chrome = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
      }

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Configurations                                           │
      -- ╰──────────────────────────────────────────────────────────╯
      dap.configurations.javascript = {
        {
          name = "Node.js",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
        },
      }

      dap.configurations.javascript = {
        {
          name = "Chrome (9222)",
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}",
        },
      }

      dap.configurations.javascriptreact = {
        {
          name = "Chrome (9222)",
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}",
        },
      }

      dap.configurations.typescriptreact = {
        {
          name = "Chrome (9222)",
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}",
        },
        {
          name = "React Native (8081)",
          type = "node2",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
          port = 8081,
        }
      }
      dap.configurations.rust = {
        {
          name = 'Launch',
          type = 'lldb',
          request = 'launch',
          program = "target/debug/${workspaceFolderBasename}",
          -- program = function()
          --   -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          -- end,
          cwd = vim.fn.getcwd(),
          stopOnEntry = false,
          args = {},

          -- 💀
          -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
          --
          --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          --
          -- Otherwise you might get the following error:
          --
          --    Error on launch: Failed to attach to the target process
          --
          -- But you should be aware of the implications:
          -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
          -- runInTerminal = false,
        },
        {
          -- If you get an "Operation not permitted" error using this, try disabling YAMA:
          --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          name = "Attach to process",
          type = 'rust', -- Adjust this to match your adapter name (`dap.adapters.<name>`)
          request = 'attach',
          pid = require('dap.utils').pick_process,
          args = {},
        },
      }
      dap.configurations.java = {
        {
          name = "Attach to process",
          type = 'jdtls', -- Adjust this to match your adapter name (`dap.adapters.<name>`)
          request = 'attach',
          pid = require('dap.utils').pick_process,
          args = {},
        }
      }
      local api = vim.api
      local keymap_restore = {}
      -- dap.listeners.after['event_initialized']['me'] = function()
      --   for _, buf in pairs(api.nvim_list_bufs()) do
      --     local keymaps = api.nvim_buf_get_keymap(buf, 'n')
      --     for _, keymap in pairs(keymaps) do
      --       if keymap.lhs == "K" then
      --         table.insert(keymap_restore, keymap)
      --         api.nvim_buf_del_keymap(buf, 'n', 'K')
      --       end
      --     end
      --   end
      --   api.nvim_set_keymap(
      --     'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
      -- end

      -- dap.listeners.after['event_terminated']['me'] = function()
      --   for _, keymap in pairs(keymap_restore) do
      --     api.nvim_buf_set_keymap(
      --       keymap.buffer,
      --       keymap.mode,
      --       keymap.lhs,
      --       keymap.rhs,
      --       { silent = keymap.silent == 1 }
      --     )
      --   end
      --   keymap_restore = {}
      -- end
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dapui = require('dapui')
      local dap = require('dap')
      dapui.setup()
      -- Automatically open UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        -- shade.toggle()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
        -- shade.toggle()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        -- shade.toggle()
      end
    end,
    dependencies = { "mfussenegger/nvim-dap" }
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap"
    },
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true,                     -- enable this plugin (the default)
        enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,            -- show stop reason when stopped for exceptions
        commented = false,                  -- prefix virtual text with comment string
        only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
        all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        ---@diagnostic disable-next-line: undefined-doc-name
        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
        --- @param buf number
        ---@diagnostic disable-next-line: undefined-doc-name
        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
        ---@diagnostic disable-next-line: unused-local
        display_callback = function(variable, buf, stackframe, node)
          return variable.name .. ' = ' .. variable.value
        end,

        -- experimental features:
        virt_text_pos = 'eol',  -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false,     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false,     -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      }
    end
  }
}
