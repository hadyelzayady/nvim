local map = vim.keymap.set

map({ "n", "v" }, "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { silent = true, desc = "Format" })

-- ====================  Code Navigation ================
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gru", function()
	vim.lsp.buf.references({ includeDeclaration = false })
end, { desc = "Go to References" })
map("n", "grr", "<cmd>LspSymbolUsages<cr>", { desc = "Symbol Usages" })
map("n", "grs", vim.lsp.buf.document_symbol, { desc = "Document Symbols" })
map("n", "grS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "Workspace Symbols" })

-- ===================== Code Actions =======================

map("n", "<leader>ci", "<cmd>LspAddMissingImports<cr>", { desc = "Add Missing Imports" })
map("n", "<leader>cc", "<cmd>LspRemoveUnused<cr>", { desc = "Remove Unused" })
map("n", "<leader>cC", "<cmd>LspRemoveUnusedImports<cr>", { desc = "Remove Unused Imports" })
map("n", "<leader>cf", "<cmd>LspFixAll<cr>", { desc = "Fix All" })

-- ===================== Inlayhints =======================
map("n", "<leader>lth", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Inlay Hints" })

map("n", "<leader>ltdl", function()
	local config = vim.diagnostic.config()
	local current = config.virtual_lines or false
	vim.diagnostic.config({ virtual_lines = not current, virtual_text = current })
end, { desc = "Virtual Lines/Text" })

map("n", "<leader>ltdt", function()
	local config = vim.diagnostic.config()
	local current = config.virtual_lines or config.virtual_text or false
	vim.diagnostic.config({ virtual_lines = not current, virtual_text = not current })
end, { desc = "On/Off" })

map("n", "<leader>ltdc", function()
	local config = vim.diagnostic.config()
	local is_enabled = config.virtual_lines

	local newConfig = {}
	if is_enabled then
		local is_current_line = type(config.virtual_lines) == "table" and config.virtual_lines.current_line
		if is_current_line then
			newConfig.virtual_lines = { current_line = false }
		else
			newConfig.virtual_lines = { current_line = true }
		end
	end

	local is_enabled_text = config.virtual_text
	if is_enabled_text then
		local is_current_line = type(config.virtual_text) == "table" and config.virtual_text.current_line
		if is_current_line then
			newConfig.virtual_text = { current_line = false }
		else
			newConfig.virtual_text = { current_line = true }
		end
	end
	vim.diagnostic.config(newConfig)
end, { desc = "Current Line" })

-- =================== Diagnostic Navigation===================
map("n", "[w", function()
	vim.diagnostic.jump({ count = -vim.v.count1, severity = "WARN" })
end, { silent = true, desc = "Prev Warning" })

map("n", "]w", function()
	vim.diagnostic.jump({ count = vim.v.count1, severity = "WARN" })
end, { silent = true, desc = "Next Warning" })

map("n", "[e", function()
	vim.diagnostic.jump({ count = -vim.v.count1, severity = "ERROR" })
end, { silent = true, desc = "Prev Error" })

map("n", "]e", function()
	vim.diagnostic.jump({ count = vim.v.count1, severity = "ERROR" })
end, { silent = true, desc = "Next Error" })

map("n", "<leader>lD", "<cmd>WorkspaceDiagnostics<cr>", { desc = "Request workspace diagnostics" })
