local M = {}

function M.config()
	-- require("coq").Now()
end

function M.thirdparty()
	require("coq_3p")({
		{ src = "nvimlua", short_name = "nLUA" },
		{ src = "bc", short_name = "MATH", precision = 6 },
		{ src = "path", short_name = "PATH", precision = 6 },
		{ src = "dap" },
	})
end

return M
