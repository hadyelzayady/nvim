local M = {}
function M.config()
    require("codecompanion").setup({
        strategies = {
            chat = {
                adapter = "copilot",
            },
            inline = {
                adapter = "copilot",
            },
        },
    })
end

return M
