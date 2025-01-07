local util = require 'utils.lsp.lspconfig'

local function fix_all(opts)
	opts = opts or {}

	local eslint_lsp_client = util.get_active_client_by_name(opts.bufnr, 'eslint')
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
	request(0, 'workspace/executeCommand', {
		command = 'eslint.applyAllFixes',
		arguments = {
			{
				uri = vim.uri_from_bufnr(bufnr),
				version = lsp.util.buf_versions[bufnr],
			},
		},
	})
end
local function find_git_ancestor(startpath)
	local path = vim.fs.dirname(startpath)

	while path do
		if vim.fn.isdirectory(path .. "/.git") == 1 then
			return path
		end
		path = vim.fs.dirname(path)
	end

	return nil
end
-- Function to determine the root directory
local function find_eslint_root(startpath)
	startpath = vim.api.nvim_buf_get_name(0)
	return vim.loop.cwd()
end

local root_file = {
	-- '.eslintrc',
	-- '.eslintrc.js',
	-- '.eslintrc.cjs',
	-- '.eslintrc.yaml',
	-- '.eslintrc.yml',
	-- '.eslintrc.json',
	-- 'eslint.config.js',
	-- 'eslint.config.mjs',
	-- 'eslint.config.cjs',
	-- 'eslint.config.ts',
	-- 'eslint.config.mts',
	-- 'eslint.config.cts',
	'package.json'
}
---@type vim.lsp.Config
return {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = {
		"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue",
		"svelte", "astro"
	},
	root_markers = {
		".git",
		'.eslintrc',
		'.eslintrc.js',
		'.eslintrc.cjs',
		'.eslintrc.yaml',
		'.eslintrc.yml',
		'.eslintrc.json',
		'eslint.config.js',
		'eslint.config.mjs',
		'eslint.config.cjs',
		'eslint.config.ts',
		'eslint.config.mts',
		'eslint.config.cts',
		'package.json',
	},
	root_dir = find_eslint_root,
	-- root_dir = function(fname)
	-- 	print(vim.inspect(fname))
	-- 	root_file = util.insert_package_json(root_file, 'eslintConfig', fname)
	-- 	return util.root_pattern(unpack(root_file))(fname)
	-- end,
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine"
			},
			showDocumentation = {
				enable = true
			}
		},
		codeActionOnSave = {
			enable = false,
			mode = "all"
		},
		experimental = {
			useFlatConfig = false
		},
		format = false,
		nodePath = "",
		onIgnoredFiles = "off",
		problems = {
			shortenToSingleLine = false
		},
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "location"
		}
	},
	on_new_config = function(config, new_root_dir)
		-- The "workspaceFolder" is a VSCode concept. It limits how far the
		-- server will traverse the file system when locating the ESLint config
		-- file (e.g., .eslintrc).
		config.settings.workspaceFolder = {
			uri = new_root_dir,
			name = vim.fn.fnamemodify(new_root_dir, ':t'),
		}

		-- Support flat config
		if
			vim.fn.filereadable(new_root_dir .. '/eslint.config.js') == 1
			or vim.fn.filereadable(new_root_dir .. '/eslint.config.mjs') == 1
			or vim.fn.filereadable(new_root_dir .. '/eslint.config.cjs') == 1
			or vim.fn.filereadable(new_root_dir .. '/eslint.config.ts') == 1
			or vim.fn.filereadable(new_root_dir .. '/eslint.config.mts') == 1
			or vim.fn.filereadable(new_root_dir .. '/eslint.config.cts') == 1
		then
			config.settings.experimental.useFlatConfig = true
		end

		-- Support Yarn2 (PnP) projects
		local pnp_cjs = new_root_dir .. '/.pnp.cjs'
		local pnp_js = new_root_dir .. '/.pnp.js'
		if vim.loop.fs_stat(pnp_cjs) or vim.loop.fs_stat(pnp_js) then
			config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
		end
	end,
	handlers = {
		['eslint/openDoc'] = function(_, result)
			if not result then
				return
			end
			local sysname = vim.loop.os_uname().sysname
			if sysname:match 'Windows' then
				os.execute(string.format('start %q', result.url))
			elseif sysname:match 'Linux' then
				os.execute(string.format('xdg-open %q', result.url))
			else
				os.execute(string.format('open %q', result.url))
			end
			return {}
		end,
		['eslint/confirmESLintExecution'] = function(_, result)
			if not result then
				return
			end
			return 4 -- approved
		end,
		['eslint/probeFailed'] = function()
			vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
			return {}
		end,
		['eslint/noLibrary'] = function()
			vim.notify('[lspconfig] Unable to find ESLint library.', vim.log.levels.WARN)
			return {}
		end,
	},
	commands = {
		EslintFixAll = {
			function()
				fix_all { sync = true, bufnr = 0 }
			end,
			description = 'Fix all eslint problems for this buffer',
		},
	},
}
