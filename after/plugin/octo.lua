-- Config.new_autocmd("CmdUndefined", "Octo", function()
-- 	vim.defer_fn(function()
-- 		local ok, octo = pcall(require, "octo")
-- 		if ok then
-- 			octo.setup({
-- 				picker = "fzf-lua",
-- 				use_local_fs = true,
-- 			})
-- 		end
-- 	end, 0)
-- end, "Lazy load octo on Octo command")

local ok, octo = pcall(require, "octo")
if ok then
	octo.setup({
		picker = "fzf-lua",
		use_local_fs = true,
	})
end
