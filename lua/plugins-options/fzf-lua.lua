local M={}

function M.config()
    require("fzf-lua").setup({"max-perf"})
    require("fzf-lua").register_ui_select()
end

return M
