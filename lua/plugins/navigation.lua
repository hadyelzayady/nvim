return {
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        config=require("plugins.config.fzf-lua").config,
        dependencies = { "echasnovski/mini.icons" }
    },
    {
        "ms-jpq/chadtree",
        build="python3 -m chadtree deps",
        branch="chad",
        lazy=true,
        cmd={"CHADopen"},
        config=require("plugins.config.chadtree").config
    },
    {

        "chrishrb/gx.nvim",
        keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
        cmd = { "Browse" },
        dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Neovim < 0.10.0
        submodules = false,
        opts = require("plugins.config.gx").opts
    },
}
