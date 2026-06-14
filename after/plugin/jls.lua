local ok, mod = pcall(require, "jls")

local lombok_jar = vim.fn.expand("~/.local/share/lombok.jar")

if ok and mod.setup then
	mod.setup({
		root_markers = {
			-- "pom.xml",
			-- "build.gradle",
			-- "build.gradle.kts",
			-- "settings.gradle",
			-- "settings.gradle.kts",
			-- "WORKSPACE",
			-- "WORKSPACE.bazel",
			-- ".java-version",
			".git",
		},

		-- jvm_args = { "-javaagent:" .. lombok_jar },
	})
end
