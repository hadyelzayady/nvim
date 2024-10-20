return {
  {
    "zeioth/heirline-components.nvim",
    -- opts = {
    --   icons = require("base.icons.nerd_font")
    -- }
  },
  {
    "rebelot/heirline.nvim",
    dependencies = { "zeioth/heirline-components.nvim" },
    event = "VeryLazy",
    opts = function()
      local utils = require('heirline.utils')
      -- Fetch colors from the TokyoNight theme's highlight groups
      local colors = {
        fg = utils.get_highlight("Normal").fg,            -- Default foreground
        bg = utils.get_highlight("Normal").bg,            -- Default background
        blue = utils.get_highlight("Function").fg,        -- Blue for functions
        red = utils.get_highlight("Error").fg,            -- Red for modified indicator
        winbar_bg = utils.get_highlight("StatusLine").bg, -- Use StatusLine background for Winbar
      }
      local lib = require "heirline-components.all"
      -- Setup for the Winbar
      local winbar = {
        {
          -- Condition to show the filename only when the buffer is not empty
          condition = function()
            return vim.api.nvim_buf_get_name(0) ~= ""
          end,
          -- The provider that displays the filename aligned to the right
          {
            provider = function()
              local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
              return filename
            end,

            -- Make the filename stand out
            hl = {
              fg = 'green',          -- Filename in blue
              bg = colors.winbar_bg, -- Distinguishable background for the Winbar
              bold = true,           -- Make the text bold for emphasis
            },

          },
          {
            -- Show an icon if the buffer is modified
            provider = function()
              if vim.bo.modified then
                return "  " -- Unicode icon for "modified" (or use any other)
              end
              return ""
            end,
            hl = {
              fg = colors.red, -- Make the modified icon red
            },
          },
        },
        {
          provider = "%=" -- This ensures the breadcrumbs are centered
        },
        {
          require("heirline-components.all").component.breadcrumbs(),
          padding = { left = 0 },
        },
        {
          provider = "%=" -- This ensures the breadcrumbs are centered
        },
      }
      return {
        winbar = winbar,

        opts = {
          disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
            local is_disabled = not require("heirline-components.buffer").is_valid(args.buf) or
                lib.condition.buffer_matches({
                  buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                  filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
                }, args.buf)
            return is_disabled
          end,
        },
        -- tabline = { -- UI upper bar
        --   lib.component.tabline_conditional_padding(),
        --   lib.component.tabline_buffers(),
        --   lib.component.fill { hl = { bg = "tabline_bg" } },
        --   lib.component.tabline_tabpages()
        -- },
        -- winbar = { -- UI breadcrumbs bar
        --   init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        --   fallthrough = false,
        --   -- Winbar for terminal, neotree, and aerial.
        --   {
        --     condition = function() return not lib.condition.is_active() end,
        --     {
        --       lib.component.neotree(),
        --       lib.component.compiler_play(),
        --       lib.component.fill(),
        --       lib.component.compiler_build_type(),
        --       lib.component.compiler_redo(),
        --       lib.component.aerial(),
        --     },
        --   },
        --   -- Regular winbar
        --   {
        --     lib.component.neotree(),
        --     lib.component.compiler_play(),
        --     lib.component.fill(),
        --     lib.component.breadcrumbs(),
        --     lib.component.fill(),
        --     lib.component.compiler_redo(),
        --     lib.component.aerial(),
        --   }
        -- },
        -- statuscolumn = { -- UI left column
        --   init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        --   lib.component.foldcolumn(),
        --   lib.component.numbercolumn(),
        --   lib.component.signcolumn(),
        -- } or nil,
        statusline = { -- UI statusbar
          hl = { fg = "fg", bg = "bg" },
          lib.component.git_branch(),
          lib.component.git_diff(),
          lib.component.file_info({
            filename = {},      -- if set, displays the filename.
            filetype = false,
            file_modified = {}, -- if set, displays a white dot if the file has been modified.
          }),
          lib.component.diagnostics(),
          lib.component.fill(),
          lib.component.cmd_info(),
          lib.component.fill(),
          lib.component.lsp(),
          lib.component.file_info(),
          lib.component.compiler_state(),
          lib.component.nav(),
        },
      }
    end,
    config = function(_, opts)
      local heirline = require("heirline")
      local heirline_components = require "heirline-components.all"

      -- Setup
      heirline_components.init.subscribe_to_events()
      heirline.load_colors(heirline_components.hl.get_colors())
      heirline.setup(opts)
    end,
  },

}
