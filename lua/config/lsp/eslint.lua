local util = require("config.lsp.utils.lspconfig-utils")
local lsp = vim.lsp
local function fix_all(opts)
	opts = opts or {}

	local eslint_lsp_client = util.get_active_client_by_name(opts.bufnr, "eslint")
	if eslint_lsp_client == nil then
		return
	end

	local request
	if opts.sync then
		request = function(bufnr, method, params)
			eslint_lsp_client.request_sync(method, params, nil, bufnr)
		end
	else
		request = function(bufnr, method, params)
			eslint_lsp_client.request(method, params, nil, bufnr)
		end
	end

	local bufnr = util.validate_bufnr(opts.bufnr or 0)
	request(0, "workspace/executeCommand", {
		command = "eslint.applyAllFixes",
		arguments = {
			{
				uri = vim.uri_from_bufnr(bufnr),
				version = lsp.util.buf_versions[bufnr],
			},
		},
	})
end

vim.lsp.config["eslint"] = {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
		"svelte",
		"astro",
	},
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git","eslintrc.json" },
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		experimental = {
			useFlatConfig = false,
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		problems = {
			shortenToSingleLine = false,
		},
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
	commands = {
		EslintFixAll = {
			function()
				fix_all({ sync = true, bufnr = 0 })
			end,
			description = "Fix all eslint problems for this buffer",
		},
	},
}
