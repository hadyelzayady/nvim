local M = {}

function M.format(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      local ft = vim.bo[bufnr].filetype

      local have_null_ls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0
      if have_null_ls then
        return client.name == "null-ls"
      else
        return client.name ~= "null-ls"
      end
    end,
    bufnr = bufnr,
    async = true
  }
end

return M
