require("lint").linters_by_ft = {
	-- java = { "checkstyle" },
}
-- local checkstyle = require("lint").linters.checkstyle
-- checkstyle.args = {
-- 	"-cp",
-- 	vim.fn.getcwd()
-- 		.. "/config/checkstyle/spring-javaformat-checkstyle-0.0.47.jar:"
-- 		.. vim.fn.getcwd()
-- 		.. "/config/checkstyle/spring-javaformat-checkstyle-0.0.47.jar",
-- }
-- checkstyle.config_file = vim.fn.getcwd() .. "/config/checkstyle/checkstyle.xml"

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		-- try_lint without arguments runs the linters defined in `linters_by_ft`
-- 		-- for the current filetype
-- 		require("lint").try_lint()
-- 	end,
-- })
