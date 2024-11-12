return function(setup_lsp)
	setup_lsp("biome", {
		cmd = { "bunx", "biome", "lsp-proxy" },
		settings = {
			-- Biome settings here
		},
	})
end
