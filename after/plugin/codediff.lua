Config.new_autocmd("CmdUndefined", "CodeDiff", function()
	Config.lazy_require("codediff", { diff = { compute_moves = true } })
end, "Lazy load codediff on CodeDiff command")
