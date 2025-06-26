local M={}

function M.config()
    local chadtree_settings = { 
        ["keymap.quit"]={ },
        ["ignore.path_glob"]={ },
    }
    vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

end

return M
