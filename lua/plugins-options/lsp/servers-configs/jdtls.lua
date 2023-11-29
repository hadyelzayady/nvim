local M = {}

local function extend_or_override(config, custom, ...)
	if type(custom) == "function" then
		config = custom(config, ...) or config
	elseif custom then
		config = vim.tbl_deep_extend("force", config, custom) --[[@as table]]
	end
	return config
end
function M.opts()
	return {

		-- These depend on nvim-dap, but can additionally be disabled by setting false here.
		dap = { hotcodereplace = "auto", config_overrides = {} },
		test = true,
	}
end

function M.config(_, opts)
	-- Find the extra bundles that should be passed on the jdtls command-line
	-- if nvim-dap is enabled with java debug/test.
	local mason_registry = require("mason-registry")
	local bundles = {} ---@type string[]
	local java_dbg_pkg = mason_registry.get_package("java-debug-adapter")
	local java_dbg_path = java_dbg_pkg:get_install_path()
	local jar_patterns = {
		java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
	}
	-- java-test also depends on java-debug-adapter.
	if opts.test and mason_registry.is_installed("java-test") then
		local java_test_pkg = mason_registry.get_package("java-test")
		local java_test_path = java_test_pkg:get_install_path()
		vim.list_extend(jar_patterns, {
			java_test_path .. "/extension/server/*.jar",
		})
	end
	for _, jar_pattern in ipairs(jar_patterns) do
		for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
			table.insert(bundles, bundle)
		end
	end

	local jdtls = require("jdtls")
	local fname = vim.api.nvim_buf_get_name(0)
	local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

	local path_to_lsp_server = jdtls_path .. "/config_mac"
	local path_to_plugins = jdtls_path .. "/plugins/"
	local path_to_jar = path_to_plugins .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
	local lombok_path = jdtls_path .. "/lombok.jar"

	local function attach_jdtls()
		local root_dir = vim.fn.getcwd()
		-- local root_dir = require("lspconfig.server_configurations.jdtls").default_config.root_dir
		local project_name = "pmp-backend"
		local workspace = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
		local extendedClientCapabilities = jdtls.extendedClientCapabilities
		extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
		-- Configuration can be augmented and overridden by opts.jdtls
		local config = {
			cmd = {
				jdtls_path .. "/jdtls",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-javaagent:" .. lombok_path,
				"-Xmx4g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				path_to_jar,
				"-configuration",
				path_to_lsp_server,
				"-data",
				workspace,
			},
			root_dir = root_dir,
			init_options = {
				bundles = bundles,
				extendedClientCapabilities = extendedClientCapabilities,
			},
			-- enable CMP capabilities
			capabilities = require("plugins-options.lsp.servers-configs").capabilities,
			on_attach = function(client, buffer)
				client.server_capabilities.documentFormattingProvider = nil
				local jdtls2 = require("jdtls")

				jdtls2.setup_dap({ hotcodereplace = "auto" })
				jdtls2.setup.add_commands()
			end,
			settings = {
				java = {
					-- home = "/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home",
					maven = {
						downloadSources = true,
					},
					implementationsCodeLens = {
						enabled = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					references = {
						includeDecompiledSources = true,
					},

					-- configuration = {
					-- 	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
					-- 	-- And search for `interface RuntimeOption`
					-- 	-- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
					-- 	runtimes = {
					-- 		{
					-- 			-- name = "AmazonCorretto17",
					-- 			-- path = "/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home",
					-- 			-- default = true,
					-- 		},
					-- 	},
					-- },
				},
			},
		}
		-- Existing server will be reused if the root_dir matches.
		require("jdtls").start_or_attach(config)
	end

	-- require("jdtls").setup_dap(opts.dap)
	-- require("jdtls.dap").setup_dap_main_class_configs()
	-- Attach the jdtls for each java buffer. HOWEVER, this plugin loads
	-- depending on filetype, so this autocmd doesn't run for the first file.
	-- For that, we call directly below.
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "java",
		callback = attach_jdtls,
	})

	-- Avoid race condition by calling attach the first time, since the autocmd won't fire.
	attach_jdtls()
end

return M
