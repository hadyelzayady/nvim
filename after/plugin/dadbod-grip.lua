Config.new_autocmd("CmdUndefined", "GripConnect", function()
	print("Loading dadbod-grip...")
	-- Config.lazy_require("dadbod-grip", { completion = false })
end, "Lazy load dadbod-grip on GripConnect command")
