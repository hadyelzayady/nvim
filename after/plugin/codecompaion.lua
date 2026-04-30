local function load_codecompanion()
	if vim.g.loaded_codecompanion then
		return
	end
	local ok, cc = pcall(require, "codecompanion")
	if ok then
		cc.setup({
			strategies = {
				chat = { adapter = "copilot" },
				inline = { adapter = "copilot" },
			},
			extensions = { history = { enabled = true } },
		})
		vim.g.loaded_codecompanion = 1
	end
end

local cmds = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionHistory" }
for _, cmd in ipairs(cmds) do
	Config.new_autocmd("CmdUndefined", cmd, function()
		vim.defer_fn(load_codecompanion, 0)
	end, "Lazy load codecompanion on " .. cmd)
end
