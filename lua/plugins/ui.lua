return {
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.duckbones_darken_comments = 100
            vim.g.duckbones_lighten_cursor_line = 15
            vim.g.duckbones_lighten_noncurrent_window = true
            vim.cmd.colorscheme("duckbones")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = require("plugins-options.treesitter").config,
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        event = "VeryLazy",
        config = require("plugins-options.mini-indentscope").config,
    },
}
