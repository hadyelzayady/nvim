return {
    {
        "stevearc/oil.nvim",
        cmd = { "Oil" },
        dependencies = { "echasnovski/mini.icons" },
        config = require("plugins-options.oil").config,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = require("plugins-options.nvim-tree").config,
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "echasnovski/mini.icons" },
        event = "VeryLazy",
        config = require("plugins-options.fzf-lua").config,
    },
    {
        "stevearc/quicker.nvim",
        ft = "qf",
        opts = {
            keys = {
                {
                    ">",
                    function()
                        require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
                    end,
                    desc = "Expand quickfix context",
                },
                {
                    "<",
                    function()
                        require("quicker").collapse()
                    end,
                    desc = "Collapse quickfix context",
                },
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = require("plugins-options.flash").keys,
        config = require("plugins-options.flash").config,
        vscode = false,
    },
    {
        "echasnovski/mini.bufremove",
        version = false,
        lazy = false,
        config = require("plugins-options.mini-bufremove").config,
    },
    {
        "otavioschwanck/arrow.nvim",
        dependencies = {
            { "echasnovski/mini.icons" },
        },
        keys = { ";", "m" },
        opts = {
            show_icons = true,
            leader_key = ";",        -- Recommended to be a single key
            buffer_leader_key = "m", -- Per Buffer Mappings
        },
    },
    {
        "chrishrb/gx.nvim",
        keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
        cmd = { "Browse" },
        init = function()
            vim.g.netrw_nogx = 1
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("plugins-options.gx").config,
    },
}
