local M = {}

function M.format()
  vim.lsp.buf.format {
    filter = function(client)
      local ft = vim.bo.filetype

      local have_null_ls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0
      print('havenull:' .. client.name)
      print(have_null_ls)
      if have_null_ls then
        return client.name == "null-ls"
      else
        return client.name ~= "null-ls"
      end
    end,
    async = true
  }
end

return M
