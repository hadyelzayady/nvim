local M = {}

function M.config()
	require("java").setup({
		-- load java debugger plugins
		java_debug_adapter = {
			enable = true,
		},
		-- jdk = {
		-- 	-- install jdk using mason.nvim
		-- 	auto_install = false,
		-- },
		-- verification = {
		-- 	-- nvim-java checks for the order of execution of following
		-- 	-- * require('java').setup()
		-- 	-- * require('lspconfig').jdtls.setup()
		-- 	-- IF they are not executed in the correct order, you will see a error
		-- 	-- notification.
		-- 	-- Set following to false to disable the notification if you know what you
		-- 	-- are doing
		-- 	invalid_order = false,
		--
		-- 	-- nvim-java checks if the require('java').setup() is called multiple
		-- 	-- times.
		-- 	-- IF there are multiple setup calls are executed, an error will be shown
		-- 	-- Set following property value to false to disable the notification if
		-- 	-- you know what you are doing
		-- 	duplicate_setup_calls = false,
		--
		-- 	-- nvim-java checks if nvim-java/mason-registry is added correctly to
		-- 	-- mason.nvim plugin.
		-- 	-- IF it's not registered correctly, an error will be thrown and nvim-java
		-- 	-- will stop setup
		-- 	invalid_mason_registry = false,
		-- },
	})
end

return M
