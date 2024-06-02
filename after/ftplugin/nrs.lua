vim.lsp.start({
	cmd = { vim.fn.expand("~/projects/nrs-server/target/debug/nrs-language-server") },
})
