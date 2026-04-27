vim.o.completeopt = "menuone,preselect,fuzzy,nosort" -- Use custom behavior
vim.pack.add({
	{ src = "https://github.com/ms-jpq/coq_nvim", version = "coq" },
	{ src = "https://github.com/ms-jpq/coq.artifacts", version = "artifacts" },
	{ src = "https://github.com/ms-jpq/coq.thirdparty", version = "3p" },
})
