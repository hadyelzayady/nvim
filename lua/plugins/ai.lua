return {
    {
        "olimorris/codecompanion.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = require('plugins-options.codecompanion').config
    },
    {
        "github/copilot.vim",
        cmd = "Copilot"
    }

}
