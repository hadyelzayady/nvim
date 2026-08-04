local ok, mod = pcall(require,"diffbandit")

if ok and mod.setup then
    mod.setup()
end
