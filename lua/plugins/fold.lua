local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('  %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end
local ftMap = {
    vim = 'indent',
    python = { 'indent' },
    git = '',
    ["neo-tree"] = ''
}

return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            "neovim/nvim-lspconfig",
            "luukvbaal/statuscol.nvim",
        },
        -- keys = {
        --     { "zR", function() require("ufo").openAllFolds() end,  desc = "Open All Folds", },
        --     { "zM", function() require("ufo").closeAllFolds() end, desc = "Close All Folds", },
        -- },
        opts = {
            fold_virt_text_handler = handler,
            open_fold_hl_timeout = 150,
            close_fold_kinds = { 'imports', 'comment' },
            provider_selector = function(bufnr, filetype, buftype)
              -- if you prefer treesitter provider rather than lsp,
              -- return ftMap[filetype] or {'treesitter', 'indent'}
              return ftMap[filetype]

              -- refer to ./doc/example.lua for detail
            end
        },
        config = function(_, opts)
          require("ufo").setup(opts)
          vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
          vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
        end,
    },
    {
        "luukvbaal/statuscol.nvim",
        enabled = true,
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
              relculright = false,
              segments = {
                  { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                  { text = { "%s" },                  click = "v:lua.ScSa" },
                  { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
              },
          }
        end
    }
}
