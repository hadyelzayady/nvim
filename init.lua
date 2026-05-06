vim.loader.enable()
_G.Config = {}

local gr = vim.api.nvim_create_augroup("custom-config", {})
Config.new_autocmd = function(event, pattern, callback, desc)
	local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
	vim.api.nvim_create_autocmd(event, opts)
end

Config.lazy_require = function(mod_name, setup_opts)
	local loaded = package.loaded[mod_name]
	if not loaded then
		local ok, mod = pcall(require, mod_name)
		if ok and mod.setup then
			mod.setup(setup_opts or {})
		end
		loaded = package.loaded[mod_name]
	end
	return loaded
end
