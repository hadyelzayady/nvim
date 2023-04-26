return {
    {
        "roobert/search-replace.nvim",
        config = function()
          require("search-replace").setup({
              -- optionally override defaults
              default_replace_single_buffer_options = "gcI",
              default_replace_multi_buffer_options = "egcI",
          })
          -- show the effects of a search / replace in a live preview window
          vim.o.inccommand = "split"

          require("config.keymaps").search_replace_setup()
        end,
    }
}
