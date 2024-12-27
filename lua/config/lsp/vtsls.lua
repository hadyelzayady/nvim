vim.lsp.config["vtsls"] = {
	cmd = { "vtsls", "--stdio" },
	filetypes = require("config.lsp.utils").jsLikeFileTypes,
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
}
