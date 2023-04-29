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
      -- "hrsh7th/cmp-path",
      'saadparwaiz1/cmp_luasnip',
      'davidsierradz/cmp-conventionalcommits',
    },
    opts = function()
      local cmp = require 'cmp'
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        -- window = {
        --   -- completion = cmp.config.window.bordered(),
        --   -- documentation = cmp.config.window.bordered(),
        -- },
        formatting = {
          format = function(_, item)
            local icons = require("utils.ui-components").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
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
          { name = 'npm' }
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
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('cmp-npm').setup({})
    end
  }
}
