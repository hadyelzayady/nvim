vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.statusline" },
})

local name_to_abb = {
	["biome"] = "B",
	["biome-check"] = "BC",
	["trim_whitespace"] = "TW",
	["eslint_d"] = "ES",
	["stylua"] = "SL",
	["cssmodules_ls"] = "CSSM",
	["vtsls"] = "VTS",
	["typescript-tools"] = "TS",
}
function FilePath()
	local filename = vim.fn.expand("%:.")

	return filename
end

require("mini.statusline").setup({
	content = {
		active = function()
			MiniStatusline.section_filename = function(args)
				if vim.bo.filetype == "fyler" then
					return ""
				end
				-- In terminal always use plain name
				if vim.bo.buftype == "terminal" then
					return "%t"
				else
					return "%{%v:lua.FilePath()%}"
				end
			end

			MiniStatusline.section_diff = function(args)
				if MiniStatusline.is_truncated(args.trunc_width) then
					return ""
				end

				local summary = vim.b.minidiff_summary_string or vim.b.gitsigns_status
				if summary == nil or summary == "" then
					return ""
				end

				local icon = ""
				return icon .. " " .. (summary == "" and "-" or summary)
			end

			MiniStatusline.section_fileinfo = function(args)
				local filetype = vim.bo.filetype

				filetype = filetype

				-- Construct output string if truncated or buffer is not normal
				if MiniStatusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
					return filetype
				end
				return string.format("%s", filetype)
			end

			MiniStatusline.section_lsp = function(args)
				local bufnr = vim.api.nvim_get_current_buf()
				local clients = vim.lsp.get_clients({ bufnr = bufnr })
				if next(clients) == nil then
					return ""
				end
				local clients_name = {}
				-- map client names to abbreviations
				for i, client in ipairs(clients) do
					clients_name[i] = name_to_abb[client.name] or client.name
				end
				return " [" .. table.concat(clients_name, ", ") .. "]"
			end
			-- MiniStatusline.section_git = function(args)
			-- 	if MiniStatusline.is_truncated(args.trunc_width) then
			-- 		return ""
			-- 	end
			--
			--              local summary
			-- 	local icon = ""
			-- 	return icon .. " " .. (summary == "" and "-" or summary)
			-- end

			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff } },
				"%<", -- Mark general truncate point
				-- { hl = "MiniStatuslineDevinfo" or "", strings = { git } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics, lsp } },
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end,
		inactive = function()
			MiniStatusline.section_filename = function(args)
				if vim.bo.filetype == "fyler" then
					return ""
				end
				-- In terminal always use plain name
				if vim.bo.buftype == "terminal" then
					return "%t"
				else
					return "%{%v:lua.FilePath()%}"
				end
			end

			MiniStatusline.section_diff = function(args)
				if MiniStatusline.is_truncated(args.trunc_width) then
					return ""
				end

				local summary = vim.b.minidiff_summary_string or vim.b.gitsigns_status
				if summary == nil or summary == "" then
					return ""
				end

				local icon = ""
				return icon .. " " .. (summary == "" and "-" or summary)
			end

			MiniStatusline.section_fileinfo = function(args)
				local filetype = vim.bo.filetype

				filetype = filetype

				-- Construct output string if truncated or buffer is not normal
				if MiniStatusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
					return filetype
				end
				return string.format("%s", filetype)
			end

			MiniStatusline.section_lsp = function(args)
				local bufnr = vim.api.nvim_get_current_buf()
				local clients = vim.lsp.get_clients({ bufnr = bufnr })
				if next(clients) == nil then
					return ""
				end
				local clients_name = {}
				-- map client names to abbreviations
				for i, client in ipairs(clients) do
					clients_name[i] = name_to_abb[client.name] or client.name
				end
				return " [" .. table.concat(clients_name, ", ") .. "]"
			end
			-- MiniStatusline.section_git = function(args)
			-- 	if MiniStatusline.is_truncated(args.trunc_width) then
			-- 		return ""
			-- 	end
			--
			--              local summary
			-- 	local icon = ""
			-- 	return icon .. " " .. (summary == "" and "-" or summary)
			-- end

			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff } },
				"%<", -- Mark general truncate point
				-- { hl = "MiniStatuslineDevinfo" or "", strings = { git } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics, lsp } },
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end,
		-- inactive = function()
		-- 	MiniStatusline.section_filename = function(args)
		-- 		if vim.bo.filetype == "fyler" then
		-- 			return ""
		-- 		end
		-- 		-- In terminal always use plain name
		-- 		if vim.bo.buftype == "terminal" then
		-- 			return "%t"
		-- 		else
		-- 			return "%{%v:lua.FilePath()%}"
		-- 		end
		-- 	end
		-- 	local filename = MiniStatusline.section_filename({ trunc_width = 140 })
		-- 	local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
		-- 	return MiniStatusline.combine_groups({
		-- 		{ hl = "MiniStatuslineInactive", strings = { filename } },
		-- 		"%=", -- End left alignment
		-- 		{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
		-- 	})
		-- end,
	},
})
