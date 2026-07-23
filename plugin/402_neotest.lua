--=============== Plugins ===============--
vim.pack.add({
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/nvim-neotest/neotest" },
	-- Java
	{ src = "https://github.com/rcasia/neotest-java" },
	-- TypeScript / JavaScript
	{ src = "https://github.com/nvim-neotest/neotest-jest" },
	{ src = "https://github.com/marilari88/neotest-vitest" },
})

local neotest = require("neotest")

--=============== Setup ===============--
neotest.setup({
	adapters = {
		require("neotest-java")({
			-- ignore_wrapper = false, -- use gradlew/mvnw if present
		}),
		require("neotest-jest")({
			jestCommand = "npx jest",
			jestConfigFile = function(file)
				if string.find(file, "/apps/") then
					return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
				end
				return vim.fn.getcwd() .. "/jest.config.ts"
			end,
			env = { CI = true },
			cwd = function()
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-vitest"),
	},
	discovery = {
		enabled = true,
	},
	running = {
		concurrent = true,
	},
	output = {
		open_on_run = true,
	},
	quickfix = {
		open = false,
	},
	status = {
		virtual_text = true,
		signs = true,
	},
	icons = {
		running = "●",
		passed = "✓",
		failed = "✗",
		skipped = "○",
		unknown = "?",
	},
})

--=============== Keymaps ===============--
local nmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc, noremap = true, silent = true })
end

nmap_leader("tt", function()
	neotest.run.run()
end, "Test: Run nearest")

nmap_leader("tf", function()
	neotest.run.run(vim.fn.expand("%"))
end, "Test: Run file")

nmap_leader("td", function()
	neotest.run.run({ strategy = "dap" })
end, "Test: Debug nearest")

nmap_leader("ts", function()
	neotest.run.stop()
end, "Test: Stop")

nmap_leader("ta", function()
	neotest.run.attach()
end, "Test: Attach")

nmap_leader("to", function()
	neotest.output.open({ enter = true, auto_close = true })
end, "Test: Output (nearest)")

nmap_leader("tO", function()
	neotest.output_panel.toggle()
end, "Test: Output panel")

nmap_leader("tp", function()
	neotest.summary.toggle()
end, "Test: Summary panel")

nmap_leader("tw", function()
	neotest.watch.toggle(vim.fn.expand("%"))
end, "Test: Watch file")
