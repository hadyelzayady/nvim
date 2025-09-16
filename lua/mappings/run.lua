local map = vim.keymap.set

-- =============================== Test(rt) ================================
map("n", "<leader>rtt", '<cmd>lua require("neotest").run.run()<CR>', { desc = "Run Nearest Test" })
map(
	"n",
	"<leader>rtT",
	'<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
	{ desc = "Run Current File Tests" }
)
map("n", "<leader>rtl", '<cmd>lua require("neotest").run.run_last()<CR>', { desc = "Run Last Test" })
map("n", "<leader>rto", '<cmd>lua require("neotest").output.open({ enter = true })<CR>', { desc = "Open Test Output" })
map("n", "<leader>rtO", '<cmd>lua require("neotest").output_panel.toggle()<CR>', { desc = "Toggle Test Output Panel" })
map("n", "<leader>rts", '<cmd>lua require("neotest").summary.toggle()<CR>', { desc = "Toggle Test Summary" })
map(
	"n",
	"<leader>rtd",
	'<cmd>lua require("neotest").run.run({ strategy = "dap" })<CR>',
	{ desc = "Debug Nearest Test" }
)
map(
	"n",
	"<leader>rtD",
	'<cmd>lua require("neotest").run.run(vim.fn.expand("%"), { strategy = "dap" })<CR>',
	{ desc = "Debug Current File Tests" }
)
map("n", "<leader>rtq", '<cmd>lua require("neotest").run.stop()<CR>', { desc = "Stop Tests" })

-- =============================== Debug(rd) ================================
