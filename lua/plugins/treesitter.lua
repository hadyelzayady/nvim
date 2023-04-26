return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = "BufReadPost",
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>",      desc = "Schrink selection",  mode = "x" },
        },
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-treesitter-context",
            -- "andymass/vim-matchup"
        },
        opts = {
            highlight = {
                enable = true,
                disable = function(lang, buf)
                  local max_filesize = 100 * 1024 -- 100 KB
                  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                  if ok and stats and stats.size > max_filesize then
                    return true
                  end
                end,

                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            autotag = {
                enable = true,
            },
            matchup = {
                enable = false, -- mandatory, false will disable the whole extension
                disable = { "tsx" }, -- optional, list of language that will be disabled
                -- [options]
                disable_virtual_text = true,
                include_match_words = false
            },
            ensure_installed = {
                "tsx",
                "javascript",
                "typescript",
                "bash",
                "html",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "vim",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<nop>",
                    node_decremental = "<bs>",
                },
            },
        },
        config = function(_, opts)
          require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
