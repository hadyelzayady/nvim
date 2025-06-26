local M = {}

function M.config()
	require("coq_3p")({
		{ src = "nvimlua", short_name = "nLUA" },
		{ src = "bc", short_name = "MATH", precision = 6 },
		-- { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
	})
end
return M
