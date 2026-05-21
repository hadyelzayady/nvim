local ok, mod = pcall(require,"fff")

if ok and mod.setup then
    mod.setup({
        layout = {
            prompt_position = "top", -- or 'top'
        },
        debug = {
            enabled = false, -- we expect your collaboration at least during the beta
        },
    })
end
