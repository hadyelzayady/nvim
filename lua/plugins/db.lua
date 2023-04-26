return {
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-ui" },
    { "kristijanhusak/vim-dadbod-completion",
        config = function()
          vim.cmd("autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni")
        end

    }
}
