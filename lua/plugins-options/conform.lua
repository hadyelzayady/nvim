local M = {}

local slow_format_filetypes = {}
function M.opts()
	local js_like_formatters = { "biome" }
	return {
		-- Map of filetype to formatters
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = js_like_formatters,
			javascriptreact = js_like_formatters,
			typescript = js_like_formatters,
			typescriptreact = js_like_formatters,
			scss = { "prettierd" },
			sh = { "shfmt" },
			json = { "biome" },
			html = { "prettierd" },
			go = { "gofmt", "goimports","golines" },
			-- Use the "*" filetype to run formatters on all files.
			-- Note that if you use this, you may want to set lsp_fallback = "always"
			-- (see :help conform.format)
			["*"] = { "trim_whitespace" },
		},
		-- If this is set, Conform will run the formatter on save.
		-- It will pass the table to conform.format().
		format_on_save = function(bufnr)
			if slow_format_filetypes[vim.bo[bufnr].filetype] or true then
				return
			end
			local function on_format(err)
				if err and err:match("timed out$") then
					slow_format_filetypes[vim.bo[bufnr].filetype] = true
				end
			end

			return { timeout_ms = 200, lsp_fallback = true }, on_format
		end,

		format_after_save = function(bufnr)
			if not slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			return { lsp_fallback = true }
		end, -- Set the log level. Use `:ConformInfo` to see the location of the log file.
		log_level = vim.log.levels.ERROR,
		-- Conform will notify you when a formatter errors
		notify_on_error = true,
		-- Define custom formatters here
		formatters = {
			my_formatter = {
				-- This can be a string or a function that returns a string
				command = "my_cmd",
				-- OPTIONAL - all fields below this are optional
				-- A list of strings, or a function that returns a list of strings
				args = { "--stdin-from-filename", "$FILENAME" },
				-- If the formatter supports range formatting, create the range arguments here
				range_args = function(ctx)
					return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
				end,
				-- Send file contents to stdin, read new contents from stdout (default true)
				-- When false, will create a temp file (will appear in "$FILENAME" args). The temp
				-- file is assumed to be modified in-place by the format command.
				stdin = true,
				-- A function that calculates the directory to run the command in
				cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
				-- When cwd is not found, don't run the formatter (default false)
				require_cwd = true,
				-- When returns false, the formatter will not be used
				condition = function(ctx)
					return vim.fs.basename(ctx.filename) ~= "README.md"
				end,
				-- Exit codes that indicate success (default {0})
				exit_codes = { 0, 1 },
				-- Environment variables. This can also be a function that returns a table.
				env = {
					VAR = "value",
				},
			},
			-- These can also be a function that returns the formatter
			other_formatter = function()
				return {
					command = "my_cmd",
				}
			end,
		},
	}
end

return M
