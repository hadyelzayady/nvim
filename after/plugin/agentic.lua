local ok, mod = pcall(require, "agentic")

if ok and mod.setup then
	mod.setup({
		provider = "copilot-acp", -- setting the name here is all you need to get started
	})
end
