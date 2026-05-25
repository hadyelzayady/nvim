local ok, mod = pcall(require,"mini.bufremove")

if ok and mod.setup then
mod.setup()
end
