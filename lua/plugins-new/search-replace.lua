return {
  {
    -- better search
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
      require('config.keymaps').hlslens_setup()
    end
  },
  {
    "tpope/vim-abolish"
  }
}
