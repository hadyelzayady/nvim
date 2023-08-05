return {
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    opts=require("plugins-options.neogit"),
  },
  {
    "lambdalisue/gin.vim",
    cmd = { "Gin" },
    dependencies = {
      "vim-denops/denops.vim",
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilterCurrentFile",
      "LazyGitFilter",
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = require("plugins-options.gitsigns")
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
    },
    opts=require("plugins-options.diffview"),
  }

}
