local M = {}
function M.root_dir(root_markers)
    return function(cb)
        local root_dir = vim.fs.find(root_markers, {
            upward = true,
            stop = vim.uv.os_homedir(), -- Prevents searching beyond the home directory
        })[1]

        if not root_dir or root_dir:match("node_modules") then
            return nil
        end -- Ignore node_modules
        print(root_dir)
        print(vim.fs.dirname(root_dir))
        return cb(vim.fs.dirname(root_dir))
    end
end

function M.get_buffer_attached_lsp()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    local c = {}
    for _, client in pairs(clients) do
        table.insert(c, client.name)
    end
    return c
end

local diagnostic_utils = require("utils.diagnostics")
function M.populate_diagnostics_to_quickfix(diagnostics)
    -- Convert diagnostics to quickfix items
    local quickfix_items = {}
    for _, diagnostic in ipairs(diagnostics) do
        table.insert(quickfix_items, {
            bufnr = diagnostic.bufnr,
            lnum = diagnostic.lnum + 1, -- lnum is 0-indexed; adjust to 1-indexed
            col = diagnostic.col + 1, -- col is 0-indexed; adjust to 1-indexed
            text = diagnostic_utils.diagnostic_key_icon_name_map[vim.diagnostic.severity[diagnostic.severity]] .. ": " ..
                diagnostic.message,
            type = diagnostic.severity == vim.diagnostic.severity.ERROR and "E"
                or diagnostic.severity == vim.diagnostic.severity.WARN and "W"
                or "I", -- Default to "I" (info)
        })
    end

    -- Set the quickfix list
    vim.fn.setqflist(quickfix_items, "r") -- "r" means replace the list

    -- Open the quickfix window
    vim.cmd("copen")
end

return M
