return {
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = "sql",
    config = function()
      -- vim.cmd("autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni")
      vim.cmd(
        "autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })")
    end

  },
  {
    'xemptuous/sqlua.nvim',
    lazy = true,
    cmd = 'SQLua',
    config = function(_, opts) require('sqlua').setup(opts) end
  }
}
