return {
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        opts=require("plugins.config.fzf-lua").opts,
        dependencies = { "echasnovski/mini.icons" }
    },
    {
        "ms-jpq/chadtree",
        build="python3 -m chadtree deps",
        branch="chad"
    }


}
