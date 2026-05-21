local ok, mod = pcall(require,"atone")

if ok and mod.setup then
mod.setup()
end
