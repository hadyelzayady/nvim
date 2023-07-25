return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    enabled = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      'David-Kunz/cmp-npm',
      'rcarriga/cmp-dap',
      "hrsh7th/cmp-path",
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
      'davidsierradz/cmp-conventionalcommits',
    },
    opts = function()
      local cmp = require 'cmp'
      local cmp_window = require("cmp.utils.window")

      cmp_window.info_ = cmp_window.info
      cmp_window.info = function(self)
        local info = self:info_()
        info.scrollable = false
        return info
      end
      local compare = require("cmp.config.compare")
      compare.lsp_scores = function(entry1, entry2)
        local diff
        if entry1.completion_item.score and entry2.completion_item.score then
          diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
        else
          diff = entry2.score - entry1.score
        end
        return (diff < 0)
      end
      local border = function(hl)
        return {
          { "╭", hl },
          { "─", hl },
          { "╮", hl },
          { "│", hl },
          { "╯", hl },
          { "─", hl },
          { "╰", hl },
          { "│", hl },
        }
      end

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            border = border("Normal"),
            max_width = 80,
            max_height = 20,
          },
          documentation = {
            border = border("CmpDocBorder"),
          },
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            compare.offset,
            compare.exact,
            compare.lsp_scores,
            -- require("cmp-under-comparator").under,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        formatting = {
          format = function(_, vim_item)
            local icons = require("utils.ui-components").icons.kinds
            vim_item.menu = vim_item.kind
            vim_item.kind = string.format("%s", icons[vim_item.kind] or "")
            return vim_item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'npm' },
          { name = 'calc' },
          { name = 'path' }
        })
      }
    end,
    config = function(_, opts)
      local cmp = require 'cmp'

      cmp.setup(opts)

      -- -- Set configuration for specific filetype.
      -- cmp.setup.filetype('gitcommit', {
      --   sources=require'cmp'.config.sources(
      --     {{ name = 'conventionalcommits' }},
      --     {{ name = 'buffer' }}
      --   )
      -- })
      cmp.setup.filetype('java', {
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- You can specify the `cmp_git` source if you were installed it.
          { name = 'luasnip' },
        }),
        completion = {
          autocomplete = false,
        },
      })
      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })
    end
  },
  {
    'David-Kunz/cmp-npm',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    ft = "json",
    config = function()
      require('cmp-npm').setup({})
    end
  }
}
