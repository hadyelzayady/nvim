local set = vim.api.nvim_set_hl
local ns = 0 -- global namespace

set(ns, "StatusLineNormal", { fg = "#ffffff", bg = "#4C566A" })
set(ns, "StatusLineInsert", { fg = "#ffffff", bg = "#A3BE8C" })
set(ns, "StatusLineVisual", { fg = "#ffffff", bg = "#B48EAD" })
set(ns, "StatusLineReplace", { fg = "#ffffff", bg = "#BF616A" })
set(ns, "StatusLineGit",    { fg = "#EBCB8B", bg = "#3B4252" })
set(ns, "StatusLineInfo",   { fg = "#88C0D0", bg = "#3B4252" })
set(ns, "StatusLineLSP",    { fg = "#5E81AC", bg = "#3B4252" })
set(ns, "StatusLine",       { fg = "#ffffff", bg = "#3B4252" })
set(ns, "StatusLineNC",     { fg = "#ffffff", bg = "#2E3440" })
set(ns, "WinSeparator",     { fg = "#444444", bg = "NONE" })
set(ns, "FloatBorder",      { fg = "#444444", bg = "NONE" })
set(ns, "Pmenu",            { fg = "#cccccc", bg = "#222222" })
set(ns, "PmenuSel",         { fg = "#ffffff", bg = "#444444" })
