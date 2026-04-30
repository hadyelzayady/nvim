require("mini.keymap").setup({})

local map_combo = require("mini.keymap").map_combo

-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.
local mode = { "i", "c", "s" }
map_combo(mode, "jk", "<BS><BS><Esc>")
