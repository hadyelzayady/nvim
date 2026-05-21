local ok, mod = pcall(require,"bqf")

if ok and mod.setup then
    mod.setup({
        preview = {
            auto_preview = false,
            winblend = 6,
        },
    })
end
