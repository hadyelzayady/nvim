vim.lsp.config["biome"] = {
	cmd = { "bunx", "biome", "lsp-proxy" },
	filetypes = require("config.lsp.utils").jsLikeFileTypes,
	root_markers = { "biome.json", "biome.jsonc" },
}
