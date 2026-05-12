vim.cmd.colorscheme("habamax")
local set = vim.api.nvim_set_hl
local ns = 0 -- global namespace

set(ns, "FloatBorder", { fg = "#444444", bg = "NONE" })
set(ns, "MyWinBar", { fg = "#ffffff", bg = "#1f3f2e" })
set(ns, "WinBarContext", { fg = "#cccccc", bg = "#222222" })
set(ns, "MiniStatuslineProgressInfo", { fg = "#1f3f2e" })
