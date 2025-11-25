local M = {}

local bundles = {}
function M:setup()
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local mason = vim.fn.stdpath("data") .. "/mason"
	-- Test
	local java_test_path = mason .. "/packages/java-test"
	-- java_test_path /Users/jgarcia/.local/share/nvim/mason/packages/java-test
	-- print("java_test_path", java_test_path)

	local java_test_bundle = vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n")
	if java_test_bundle[1] ~= "" then
		vim.list_extend(bundles, java_test_bundle)
	end
	-- End Test

	-- Debug
	local java_debug_path = mason .. "/packages/java-debug-adapter"
	-- print("java_debug_path", java_debug_path)
	-- java_debug_path /Users/jgarcia/.local/share/nvim/mason/packages/java-debug-adapter

	local java_debug_bundle =
		vim.split(vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n")
	if java_debug_bundle[1] ~= "" then
		vim.list_extend(bundles, java_debug_bundle)
	end
	-- End Debug

	---
	-- Include spring boot ls bundle if present
	---
	vim.list_extend(bundles, require("spring_boot").java_extensions())
	local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
	local lombok = vim.fn.stdpath("data") .. "/mason/packages/lombok-nightly/lombok.jar"
	local workspace_dir = vim.fn.stdpath("data")
		.. package.config:sub(1, 1)
		.. "jdtls-workspace"
		.. package.config:sub(1, 1)
		.. project_name
	local os_name = vim.loop.os_uname().sysname

	local config = {
		cmd = {
			"jdtls",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-Xmx1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",
			"-javaagent:" .. lombok,
			vim.fn.stdpath("data")
				.. package.config:sub(1, 1)
				.. "mason"
				.. package.config:sub(1, 1)
				.. "packages"
				.. package.config:sub(1, 1)
				.. "jdtls"
				.. package.config:sub(1, 1)
				.. "plugins"
				.. package.config:sub(1, 1)
				.. "org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
			"-configuration",
			vim.fn.stdpath("data")
				.. package.config:sub(1, 1)
				.. "mason"
				.. package.config:sub(1, 1)
				.. "packages"
				.. package.config:sub(1, 1)
				.. "jdtls"
				.. package.config:sub(1, 1)
				.. "config_"
				.. (os_name == "Windows_NT" and "win" or os_name == "Linux" and "linux" or "mac"),
			"-data",
			workspace_dir,
		},

		root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
		settings = {
			java = {
				eclipse = {
					downloadSources = true,
				},
				maven = {
					downloadSources = true,
				},
				configuration = {
					updateBuildConfiguration = "interactive",
				},
				references = {
					includeDecompiledSources = true,
				},
				implementationsCodeLens = {
					enabled = true,
				},
				referenceCodeLens = {
					enabled = true,
				},
				inlayHints = {
					parameterNames = {
						enabled = "all",
					},
				},
				signatureHelp = {
					enabled = true,
					description = {
						enabled = true,
					},
				},
				sources = {
					organizeImports = {
						starThreshold = 9999,
						staticStarThreshold = 9999,
					},
				},
			},
		},
		flags = {
			allow_incremental_sync = true,
		},
		init_options = {
			bundles = bundles,
			extendedClientCapabilities = extendedClientCapabilities,
		},
	}
	require("jdtls").start_or_attach(config)
end

return M
