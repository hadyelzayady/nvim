-- local function load_blink()
-- 	if vim.fn.exists("g:loaded_blink") == 0 then
-- 		local cmp = require("blink.cmp")
-- 		cmp.build():wait(60000)
-- 		cmp.setup({
-- 			sources = {
-- 				providers = {
-- 					dadbod_grip = { name = "Grip SQL", module = "dadbod-grip.completion.blink" },
-- 				},
-- 				per_filetype = {
-- 					sql = { "dadbod_grip", "snippets", "buffer" },
-- 				},
-- 			},
-- 			completion = {
-- 				documentation = { auto_show = true },
-- 				menu = {
-- 					draw = {
-- 						columns = {
-- 							{ "label", "label_description", gap = 1 },
-- 							{ "kind_icon", "kind", gap = 1, "source_name" },
-- 						},
-- 					},
-- 				},
-- 			},
-- 			keymap = {
-- 				preset = "enter",
-- 			},
-- 		})
-- 		vim.g.loaded_blink = 1
-- 	end
-- end
--
-- Config.new_autocmd("InsertEnter", nil, load_blink, "Lazy load blink on InsertEnter")

local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup({
	sources = {
		providers = {
			dadbod_grip = { name = "Grip SQL", module = "dadbod-grip.completion.blink" },
		},
		per_filetype = {
			sql = { "dadbod_grip", "snippets", "buffer" },
		},
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
