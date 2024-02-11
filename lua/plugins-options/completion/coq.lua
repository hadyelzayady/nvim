local M = {}

function M.config()
	vim.g.coq_settings = {
		auto_start = true,
		display = {
			preview = {
				positions = { east = 1, north = 2, south = 3, west = 4 },
			},
			pum = {
				x_max_len = 50,
				x_truncate_len = 12,
			},
		},
	}
  require("coq").Now()
end

function M.thirdparty()
	require("coq_3p")({
		{ src = "nvimlua", short_name = "nLUA" },
		{ src = "bc", short_name = "MATH", precision = 6 },
		{ src = "dap" },
	})
end

return M
