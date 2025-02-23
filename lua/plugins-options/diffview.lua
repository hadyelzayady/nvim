local M = {}

function M.config()
    require("diffview").setup({
        hooks = {
            diff_buf_read = function(bufnr)
                vim.opt_local.wrap = false
                vim.opt_local.list = false
            end,
        }
    })
end

M.cmd = {
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewFocusFiles",
    "DiffviewLog",
    "DiffviewOpen",
    "DiffviewRefresh",
    "DiffviewToggleFiles",
}

return M
