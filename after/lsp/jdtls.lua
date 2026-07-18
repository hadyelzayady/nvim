return {

	root_dir = vim.fs.root(0, { "gradlew" }),
	-- root_markers = {
	-- 	-- "pom.xml",
	-- 	"build.gradle",
	-- 	-- "build.gradle.kts",
	-- 	-- "settings.gradle",
	-- 	-- "settings.gradle.kts",
	-- 	-- "WORKSPACE",
	-- 	-- "WORKSPACE.bazel",
	-- 	-- ".java-version",
	-- 	-- ".git",
	-- },
	settings = {
		java = {
			-- Custom eclipse.jdt.ls options go here
			signatureHelp = { enabled = true }, -- Force enable signature help
		},
	},
}
