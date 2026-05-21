local ok, mod = pcall(require,"quicker")

if ok and mod.setup then
    mod.setup(setup_opts or {})
end
