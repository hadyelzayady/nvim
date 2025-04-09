local M = {}
function M.toggle_diffopt(opt)
    return function()
        local diffopt = vim.opt.diffopt:get()
        local has_vertical = vim.tbl_contains(diffopt, opt)

        if has_vertical then
            vim.opt.diffopt:remove(opt)
        else
            vim.opt.diffopt:append(opt)
        end
    end
end

return M
