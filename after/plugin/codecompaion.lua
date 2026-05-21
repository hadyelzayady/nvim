local ok, mod = pcall(require,"codecompanion")

if ok and mod.setup then
    mod.setup({
        strategies = {
            chat = {
                adapter = "copilot",
            },
            inline = {
                adapter = "copilot",
            },
        },

        extensions = {
            history = {

                enabled = true,
            },
        },
    })
end
