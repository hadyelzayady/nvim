local ok, mod = pcall(require, "lsp-file-operations")

if ok and mod.setup then
	mod.setup()
end
