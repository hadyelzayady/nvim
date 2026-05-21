local ok, mod = pcall(require,"aerial")

if ok and mod.setup then
    mod.setup(setup_opts or {})
end
