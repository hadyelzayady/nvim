local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup({
	completion = {
		documentation = { auto_show = true },
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
