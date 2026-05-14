return {
	cmd = { "nova-lsp" },
	filetypes = { "java" },
	root_markers = {
		"nova.toml",
		".nova.toml",
		"nova.config.toml",
		".nova/config.toml",
		"pom.xml",
		"build.gradle",
		"build.gradle.kts",
		"settings.gradle",
		"settings.gradle.kts",
		-- Bazel workspace markers.
		"WORKSPACE",
		"WORKSPACE.bazel",
		"MODULE.bazel",
		".git",
		".nova",
	},
}
