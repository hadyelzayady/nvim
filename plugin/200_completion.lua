vim.o.completeopt = "menuone,preselect,fuzzy,nosort" -- Use custom behavior
vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/mikavilpas/blink-ripgrep.nvim" },
	{ src = "https://github.com/Kaiser-Yang/blink-cmp-git" },
	{ src = "https://github.com/alexandre-abrioux/blink-cmp-npm.nvim" },
})

-- vim.api.nvim_create_autocmd("PackChanged", {
-- 	callback = function(ev)
-- 		local name, kind = ev.data.spec.name, ev.data.kind
-- 		if name == "blink.cmp" and (kind == "install" or kind == "update") then
-- 			if not ev.data.active then
-- 				vim.cmd.packadd("blink.cmp")
-- 			end
-- 			require("blink.cmp").build():wait(60000)
-- 		end
-- 	end,
-- })
vim.pack.add({ "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" })
local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
	sources = {
		providers = {
			dadbod_grip = { name = "Grip SQL", module = "dadbod-grip.completion.blink" },
		},
		per_filetype = {
			sql = { "dadbod_grip", "snippets", "buffer" },
		},
	},
	-- fuzzy = {
	-- 	implementation = "lua",
	-- },
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
