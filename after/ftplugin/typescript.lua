vim.lsp.start({
	cmd = { vim.fn.expand("~/projects/rtsserver/target/debug/rts-language-server") },
})
