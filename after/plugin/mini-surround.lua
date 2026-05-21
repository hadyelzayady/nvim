local ok, mod = pcall(require,"mini.surround")

if ok and mod.setup then
    mod.setup(setup_opts or {})
end
