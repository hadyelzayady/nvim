--=============== Plugins ===============--
vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*") },
	-- { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
})

local dap = require("dap")
local dap_view = require("dap-view")

--=============== UI: dap-view ===============--
dap_view.setup()

--=============== Virtual text ===============--
-- require("nvim-dap-virtual-text").setup({
-- 	commented = true,
-- })

--=============== Signs ===============--
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "◈", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticSignHint", linehl = "Visual", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

--=============== Auto open/close dap-view ===============--
dap.listeners.before.attach["dap-view-config"] = function()
	dap_view.open()
end
dap.listeners.before.launch["dap-view-config"] = function()
	dap_view.open()
end
dap.listeners.before.event_terminated["dap-view-config"] = function()
	dap_view.close()
end
dap.listeners.before.event_exited["dap-view-config"] = function()
	dap_view.close()
end

--=============== Java ===============--
-- Java adapters/configurations are provided by `nvim-java`, which is set up in
-- `plugin/103_lsp.lua` via `require("java").setup()`. It automatically installs
-- and registers `java-debug-adapter` and `java-test` with `nvim-dap`, so the
-- `dap.configurations.java` are available once `jdtls` attaches to a buffer.
-- Extra manual configs can be appended here. `nvim-java` only generates
-- `launch` configurations, so we add `attach` (remote debugging) configs to
-- connect to a JVM started with JDWP, e.g.:
--   -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005
dap.configurations.java = dap.configurations.java or {}

vim.list_extend(dap.configurations.java, {
	{
		type = "java",
		request = "attach",
		name = "Java: Attach to remote (localhost:5005)",
		hostName = "127.0.0.1",
		port = 5005,
	},
	{
		type = "java",
		request = "attach",
		name = "Java: Attach to remote (prompt host/port)",
		hostName = function()
			return vim.fn.input("Host [127.0.0.1]: ", "127.0.0.1")
		end,
		port = function()
			return tonumber(vim.fn.input("Port [5005]: ", "5005"))
		end,
	},
})

-- Convenience keymap to jump straight into an attach session.
vim.keymap.set("n", "<Leader>da", function()
	dap.run({
		type = "java",
		request = "attach",
		name = "Java: Attach (prompt host/port)",
		hostName = vim.fn.input("Host [127.0.0.1]: ", "127.0.0.1"),
		port = tonumber(vim.fn.input("Port [5005]: ", "5005")),
	})
end, { desc = "Debug: Attach to Java (remote)", noremap = true, silent = true })

--=============== Keymaps ===============--
local nmap_leader = function(suffix, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc, noremap = true, silent = true })
end

nmap_leader("db", dap.toggle_breakpoint, "Toggle breakpoint")
nmap_leader("dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "Conditional breakpoint")
nmap_leader("dc", dap.continue, "Continue / Start")
nmap_leader("dC", dap.run_to_cursor, "Run to cursor")
nmap_leader("di", dap.step_into, "Step into")
nmap_leader("do", dap.step_over, "Step over")
nmap_leader("dO", dap.step_out, "Step out")
nmap_leader("dr", dap.repl.toggle, "Toggle REPL")
nmap_leader("dl", dap.run_last, "Run last")
nmap_leader("dt", dap.terminate, "Terminate")
nmap_leader("dh", require("dap.ui.widgets").hover, "Hover")
nmap_leader("da", function()
	dap.run({
		type = "java",
		request = "attach",
		name = "Java: Attach (prompt host/port)",
		hostName = vim.fn.input("Host [127.0.0.1]: ", "127.0.0.1"),
		port = tonumber(vim.fn.input("Port [5005]: ", "5005")),
	})
end, "Attach to Java (remote)")
nmap_leader("dv", function()
	dap_view.toggle()
end, "Toggle DAP view")
nmap_leader("de", function()
	require("dap-view").add_expr()
end, "Eval expression (watch)")

-- Function keys (common debugger bindings)
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue", silent = true })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step over", silent = true })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step into", silent = true })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step out", silent = true })



