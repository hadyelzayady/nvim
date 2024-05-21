local M = {}

function M.config(_, opts)
	require("neotest").setup({
		adapters = {
      require('rustaceanvim.neotest'),
			require("neotest-java")({
				ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
				-- junit_jar = "~/.m2/repository/org",
				-- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
			}),
			require("neotest-jest")({
				jestCommand = "npm test --",
				-- jestConfigFile = "custom.jest.config.ts",
				env = { CI = true },
				cwd = function(path)
					return vim.fn.getcwd()
				end,
			}),
		},
	})
	require("config.keymaps").neotest()
end

return M
