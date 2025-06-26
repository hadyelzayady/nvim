local M={}

function M.config()
    local fzf = require("fzf-lua")
    local actions = require("fzf-lua.actions")
    fzf.setup({
        "hide",
        "max-perf",
        previewers = {
            -- builtin = {
            --     extensions = {
            --         -- neovim terminal only supports `viu` block output
            --         ["png"] = { "viu", "-b" },
            --         ["jpg"] = { "viu", "-b" },
            --     },
            -- },
        },
        winopts = {
            preview = { default = "builtin" },
        },
        keymap = {
            builtin = {
                true,
                ["<Esc>"] = "hide",
                ["<c-space>"] = "toggle-preview",
            },
        },
        files = {
            prompt = "Files❯ ",
            multiprocess = true, -- run command in a separate process
            cwd_prompt = false,
            fzf_opts = {
                ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
            },
            winopts = { preview = { hidden = true } },
        },
        oldfiles = {
            prompt = "History❯ ",
            cwd_only = true,
            stat_file = true,               -- verify files exist on disk
            include_current_session = true, -- include bufs from current session
            fzf_opts = {
                ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-old-files-history",
            },
            winopts = { preview = { hidden = true } },
        },
        buffers = {
            prompt = "Buffers❯ ",
            sort_lastused = true, -- sort buffers() by last used
            show_unloaded = true, -- show unloaded buffers
            cwd_only = true,      -- buffers for the cwd only
            fzf_opts = {
                ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-buffers",
            },
            winopts = { preview = { hidden = true } },
        },
        grep = {
            multiprocess = true,       -- run command in a separate process
            rg_glob = true,            -- default to glob parsing?
            glob_flag = "--iglob",     -- for case sensitive globs use '--glob'
            glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
            fzf_opts = {
                ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
            },
            winopts = { preview = { hidden = false } },
        },
        git = {
            branches = {
                prompt = "Branches❯ ",
                cmd = "git branch --all --color",
                preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
                actions = {
                    ["default"] = function(state)
                        os.execute("git checkout " .. state[1])
                    end,
                    ["ctrl-x"] = { fn = actions.git_branch_del, reload = true },
                    ["ctrl-a"] = { fn = actions.git_branch_add, field_index = "{q}", reload = true },
                    ["ctrl-d"] = function(state)
                        vim.cmd("DiffviewOpen " .. state[1] .. " -- %")
                    end,
                    ["ctrl-D"] = function(state)
                        vim.cmd("DiffviewOpen " .. state[1])
                    end,
                    ["ctrl-t"] = function(state)
                        os.execute("git checkout --track " .. state[1])
                    end,
                },
                -- If you wish to add branch and switch immediately
                -- cmd_add  = { "git", "checkout", "-b" },
                cmd_add = { "git", "branch" },
                -- If you wish to delete unmerged branches add "--force"
                -- cmd_del  = { "git", "branch", "--delete", "--force" },
                cmd_del = { "git", "branch", "--delete" },

                fzf_opts = {
                    ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-branches",
                },
            },
            commits = {
                actions = {
                    ["ctrl-d"] = function(state)
                        local commit = state[1]:match("[^ ]+")
                        vim.cmd("tab Gvdiffsplit " .. commit)
                    end,
                },
            },
            bcommits = {
                actions = {
                    ["ctrl-d"] = function(state)
                        local commit = state[1]:match("[^ ]+")
                        vim.cmd("tab Gvdiffsplit " .. commit)
                    end,
                },
            },
        },
    })
    fzf.register_ui_select()
end

return M
