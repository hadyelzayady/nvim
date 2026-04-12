-- Shared filetype settings
-- Use: local settings = require("ftplugin.settings")

local M = {}

-- 2-space indent settings (Lua, JS, TS, HTML, CSS, YAML, Shell)
function M.two_space()
	local opt = vim.opt_local
	opt.expandtab = true
	opt.tabstop = 2
	opt.shiftwidth = 2
	opt.softtabstop = 2
end

-- 4-space indent settings (Python, Go, Rust, C/C++)
function M.four_space()
	local opt = vim.opt_local
	opt.expandtab = false
	opt.tabstop = 4
	opt.shiftwidth = 4
	opt.softtabstop = 4
end

-- 2-space no expand (JSON, SQL)
function M.two_space_no_expand()
	local opt = vim.opt_local
	opt.expandtab = false
	opt.tabstop = 2
	opt.shiftwidth = 2
	opt.softtabstop = 2
end

-- No line numbers (qf, help, terminal)
function M.no_number()
	local opt = vim.opt_local
	opt.number = false
	opt.relativenumber = false
end

return M

