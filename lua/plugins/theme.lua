return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    init = function()
      require("tokyonight").load()
    end
  },
  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "sainnhe/sonokai",
    lazy = true,
    opts = {
      sonokai_style = 'atlantis',
      sonokai_better_performance = 1
    }
  }
}
