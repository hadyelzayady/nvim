vim.pack.add({
	{ src = "https://github.com/b0o/schemastore.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/rmagatti/goto-preview" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/antosha417/nvim-lsp-file-operations" },
	-- { src = "https://github.com/JavaHello/spring-boot.nvim" },
	-- { src = "https://github.com/mfussenegger/nvim-jdtls" },
	-- { src = "https://github.com/idelice/nvim-jls" },
})

vim.pack.add({
	{
		src = "https://github.com/JavaHello/spring-boot.nvim",
		version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
	},
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/mfussenegger/nvim-dap",

	"https://github.com/nvim-java/nvim-java",
})

require("java").setup()
--=============== Inlay Hint =============--
vim.lsp.inlay_hint.enable = true

local on_attach = function(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if client and client.server_capabilities.linkedEditingRangeProvider then
		vim.lsp.linked_editing_range.enable(true, { client_id = ev.data.client_id })
	end
end
Config.new_autocmd("LspAttach", nil, on_attach, "linked editing range")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
capabilities.general.positionEncodings = { "utf-16" }
capabilities = vim.tbl_deep_extend(
	"force",
	capabilities,
	-- returns configured operations if setup() was already called
	-- or default operations if not
	require("lsp-file-operations").default_capabilities()
)

vim.lsp.config("*", {
	capabilities = capabilities,
})
--=============== Load LSP Servers =============--
local lsp_servers = {
	"lua_ls",
	"vtsls",
	"somesass_ls",
	"cssmodules_ls",
	"yamlls",
	"jsonls",
	"biome",
	"jdtls",
	-- "nova",
	-- "tsgo",
}

--=============== Enable LSP Servers ===============
for _, server in ipairs(lsp_servers) do
	vim.lsp.enable(server)
end
