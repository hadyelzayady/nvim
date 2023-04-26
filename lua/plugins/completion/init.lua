return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    enabled = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-buffer",
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
    end
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
    config = function(_, opts)
      require("luasnip").setup(opts)

      local snippets_folder = vim.fn.stdpath "config" .. "/lua/plugins/completion/snippets/"
      print(snippets_folder)
      require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }

      vim.api.nvim_create_user_command("LuaSnipEdit", function()
        require("luasnip.loaders.from_lua").edit_snippet_files()
      end, {})
    end,
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
    },
  }
}
