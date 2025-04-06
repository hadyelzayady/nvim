local util = require("utils.lsp.lspconfig")
-- Utility function to check for ESLint config
local root_file = {
	".eslintrc",
	".eslintrc.js",
	".eslintrc.cjs",
	".eslintrc.yaml",
	".eslintrc.yml",
	".eslintrc.json",
	".eslintrc.jsonc",
	"eslint.config.js",
	"eslint.config.mjs",
	"eslint.config.cjs",
	"eslint.config.ts",
	"eslint.config.mts",
	"eslint.config.cts",
	"tsconfig.json",
}

local function has_eslint_config()
	local eslint_files = {
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.yml",
		".eslintrc.json",
		".eslintrc.jsonc",
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		"eslint.config.ts",
		"eslint.config.mts",
		"eslint.config.cts",
	}
	for _, file in ipairs(eslint_files) do
		if vim.fn.glob(file) ~= "" then
			return true
		end
	end
	return false
end
return {
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
	-- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
	-- root_dir = "/Users/hadyelzayady/Documents/projects/phelix-project-manager-portal-frontend",
	root_dir = function(bufnr,cb)
		if not has_eslint_config() then
			-- vim.notify('No ESLint config found, disabling ESLint LSP', vim.log.levels.WARN,{silent=true})
			return nil
		end
		if not vim.api.nvim_buf_is_valid(bufnr) then
			return
		end
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if #bufname ~= 0 and not util.bufname_valid(bufname) then
			return
		end
		local fname = vim.fs.normalize(bufname)
		root_file = util.insert_package_json(root_file, "eslintConfig", fname)
		cb(util.root_pattern(unpack(root_file))(fname))
	end,
	-- Refer to https://github.com/Microsoft/vscode-eslint#settings-options for documentation.
	settings = {
		validate = "on",
		packageManager = nil,
		useESLintClass = false,
		experimental = {
			useFlatConfig = false,
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		format = true,
		quiet = false,
		onIgnoredFiles = "off",
		rulesCustomizations = {},
		run = "onType",
		problems = {
			shortenToSingleLine = false,
		},
		-- nodePath configures the directory in which the eslint server should start its node_modules resolution.
		-- This path is relative to the workspace folder (root dir) of the server instance.
		nodePath = "",
		-- use the workspace folder location or the file location (if no workspace folder is open) as the working directory
		workingDirectory = { mode = "location" },
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
	},
	on_new_config = function(config, new_root_dir)
		-- The "workspaceFolder" is a VSCode concept. It limits how far the
		-- server will traverse the file system when locating the ESLint config
		-- file (e.g., .eslintrc).
		config.settings.workspaceFolder = {
			uri = new_root_dir,
			name = vim.fn.fnamemodify(new_root_dir, ":t"),
		}

		-- Support flat config
		if
			vim.fn.filereadable(new_root_dir .. "/eslint.config.js") == 1
			or vim.fn.filereadable(new_root_dir .. "/eslint.config.mjs") == 1
			or vim.fn.filereadable(new_root_dir .. "/eslint.config.cjs") == 1
			or vim.fn.filereadable(new_root_dir .. "/eslint.config.ts") == 1
			or vim.fn.filereadable(new_root_dir .. "/eslint.config.mts") == 1
			or vim.fn.filereadable(new_root_dir .. "/eslint.config.cts") == 1
		then
			config.settings.experimental.useFlatConfig = true
		end

		-- Support Yarn2 (PnP) projects
		local pnp_cjs = new_root_dir .. "/.pnp.cjs"
		local pnp_js = new_root_dir .. "/.pnp.js"
		if vim.loop.fs_stat(pnp_cjs) or vim.loop.fs_stat(pnp_js) then
			config.cmd = vim.list_extend({ "yarn", "exec" }, config.cmd)
		end
	end,
	handlers = {
		["eslint/openDoc"] = function(_, result)
			if not result then
				return
			end
			local sysname = vim.loop.os_uname().sysname
			if sysname:match("Windows") then
				os.execute(string.format("start %q", result.url))
			elseif sysname:match("Linux") then
				os.execute(string.format("xdg-open %q", result.url))
			else
				os.execute(string.format("open %q", result.url))
			end
			return {}
		end,
		["eslint/confirmESLintExecution"] = function(_, result)
			if not result then
				return
			end
			return 4 -- approved
		end,
		["eslint/probeFailed"] = function()
			-- vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
			return {}
		end,
		["eslint/noLibrary"] = function()
			vim.notify("[lspconfig] Unable to find ESLint library.", vim.log.levels.WARN)
			return {}
		end,
	},
	on_init = function(client)
		if not has_eslint_config() then
			-- vim.notify('No ESLint config found, disabling ESLint LSP', vim.log.levels.WARN,{silent=true})
			client.stop() -- Stop the LSP client if no config is found
			return
		end
		client.config.settings.workingDirectory = { directory = client.config.root_dir }
	end,
	on_attach = function(client)
		if not has_eslint_config() then
			-- vim.notify('No ESLint config found, disabling ESLint LSP', vim.log.levels.WARN,{silent=true})
			client.stop() -- Stop the LSP client if no config is found
			return
		end
		-- Your regular on_attach logic here
		-- print('ESLint attached!')
	end,
}
