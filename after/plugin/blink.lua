Config.new_autocmd({ "InsertEnter" }, nil, function()
	if vim.fn.exists("g:loaded_blink") == 0 then
		local ok, cmp = pcall(require, "blink.cmp")
		if ok and cmp.setup then
			cmp.setup({
				sources = {
					providers = {
						dadbod_grip = { name = "Grip SQL", module = "dadbod-grip.completion.blink" },
					},
					per_filetype = {
						sql = { "dadbod_grip", "snippets", "buffer" },
					},
				},
				fuzzy = {
					implementation = "lua",
				},
				completion = {
					documentation = { auto_show = true },
					list = {
						selection = {
							preselect = function(ctx)
								local win_cfg = vim.api.nvim_win_get_config(0)
								return not (win_cfg.relative ~= "" and vim.bo.filetype == "")
							end,
						},
					},
					menu = {
						draw = {
							columns = {
								{ "label", "label_description", gap = 1 },
								{ "kind_icon", "kind", gap = 1, "source_name" },
							},
						},
					},
				},
				keymap = {
					preset = "enter",
				},
			})
			vim.g.loaded_blink = 1
		end
	end
end, "Lazy load blink.cmp on InsertEnter")
