return {
  {
    'stevearc/oil.nvim',
    keys = {
      '-'
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      require("oil").setup(opts)
      require("config.keymaps").oil()
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree reveal=true toggle=true<cr>", desc = "File Explorer Reveal" },
      { "<leader>E", "<cmd>Neotree toggle=true<cr>",             desc = "File Explorer" }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts=require("plugins-options.neotree")
  }
}
