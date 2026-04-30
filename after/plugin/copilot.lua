local function load_copilot()
	if vim.fn.exists("g:loaded_copilot") == 0 then
		require("copilot").setup({
			filetypes = { sql = true },
			should_attach = function()
				return true
			end,
			nes = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
					next = "<C-j>",
					prev = "<C-k>",
					dismiss = "<C-x>",
				},
			},
		})
		vim.g.loaded_copilot = 1
	end
end

Config.new_autocmd({ "InsertEnter" }, nil, load_copilot, "Lazy load copilot on InsertEnter")
