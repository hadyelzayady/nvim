local supported_clients = {
	biome = {
		isEnabled = function()
			return vim.fn.filereadable("biome.json") == 1 or vim.fn.filereadable("biome.jsonc") == 1
		end,
		run = function(onResult)
			vim.fn.jobstart("npx biome check --reporter=github .", {
				stdout_buffered = true,
				stderr_buffered = true,
				on_stderr = function(_, output)
					-- vim.notify(
					-- 	table.concat(output, "\n"),
					-- 	vim.log.levels.ERROR,
					-- 	{ title = "🪚 Biome Error", ft = "text" }
					-- )
				end,
				on_stdout = function(_, output)
					local items = {}
					for _, line in ipairs(output) do
						local severity, meta, message = line:match("^::(%w+)%s+([^:]+)::(.+)$")
						if severity and meta then
							local data = {}
							for key, value in meta:gmatch("(%w+)=([^,]+)") do
								data[key] = value
							end

							table.insert(items, {
								filename = data.file,
								lnum = tonumber(data.line) or 1,
								col = tonumber(data.col) or 1,
								end_lnum = tonumber(data.endLine) or nil,
								end_col = tonumber(data.endColumn) or nil,
								text = "biome: " .. message,
								type = (severity == "error" and "E") or (severity == "warning" and "W") or "I",
							})
						end
					end
					onResult(items)
				end,
			})
		end,
	},
	tsc = {
		isEnabled = function()
			return vim.fn.filereadable("tsconfig.json") == 1
		end,
		run = function(onResult)
			vim.fn.jobstart("npx tsc --noEmit", {
				stdout_buffered = true,
				stderr_buffered = true,
				on_stderr = function(_, output)
					vim.notify(
						table.concat(output, "\n"),
						vim.log.levels.ERROR,
						{ title = "🪚 Tsc Error", ft = "text" }
					)
				end,
				on_stdout = function(_, output)
					local items = {}
					for _, line in ipairs(output) do
						-- Match: file(line,col): severity TS####: message
						local file, lnum, col, msg = line:match("^(.-)%((%d+),(%d+)%)%s*:%s*(.+)$")
						if file and lnum and col and msg then
							table.insert(items, {
								filename = file,
								lnum = tonumber(lnum),
								col = tonumber(col),
								text = "tsc: " .. msg,
								type = msg:match("^error") and "E" or "W",
							})
						end
					end
					onResult(items)
				end,
			})
		end,
	},
}

vim.api.nvim_create_user_command("WorkspaceDiagnostics", function(args)
	local bufnr = vim.api.nvim_get_current_buf()

	local client = vim.lsp.get_clients({ bufnr = bufnr, method = "workspace/diagnostic" })[1]
	if client then
		client.request("workspace/diagnostic", {}, function(err, result)
			if err then
				return
			end
			if not result then
				return
			end
			local items = vim.lsp.util.locations_to_items(result.items or {})
			vim.fn.setqflist(items, "r")
			vim.cmd("copen")
		end)
		return
	end
	local all_items = {}
	for name, cfg in pairs(supported_clients) do
		if cfg.isEnabled() then
			cfg.run(function(items)
				all_items = vim.list_extend(all_items, items)
				if #all_items > 0 then
					vim.fn.setqflist(all_items, "r")
					vim.fn.setqflist({}, "a", { title = "Project Diagnostics" })
					vim.cmd("copen")
				else
					vim.notify("No issues", vim.log.levels.INFO)
				end
			end)
		end
	end
end, {})
