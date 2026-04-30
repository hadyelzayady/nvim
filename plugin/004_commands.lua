vim.api.nvim_create_user_command("CloseFugitive", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "fugitive" then
			vim.api.nvim_win_close(win, false)
		end
	end
end, {})

vim.api.nvim_create_user_command("Lazygit", function()
	vim.system({ "kitty", "@", "ls" }, { text = true }, function()
		vim.system({ "kitty", "@", "launch", "--type=overlay", "--cwd=current", "lazygit" })
	end)
end, {})

vim.api.nvim_create_user_command("DiffBuf", function()
	if vim.opt.diff._value == false then
		vim.cmd("windo diffthis")
	else
		vim.cmd("windo diffoff")
	end
end, { range = true })

--================================ LSP ============================================

vim.api.nvim_create_user_command("LspRemoveUnusedImports", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr })
	for _, client in ipairs(clients) do
		if client.name == "ts_ls" or client.name == "vtsls" then
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" } },
				apply = true,
			})
			return
		end
	end
end, {})

vim.api.nvim_create_user_command("LspRemoveUnused", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr })
	for _, client in ipairs(clients) do
		if client.name == "ts_ls" or client.name == "vtsls" then
			vim.lsp.buf.code_action({
				context = { only = { "source.removeUnused" } },
				apply = true,
			})
			return
		end
	end
end, {})

vim.api.nvim_create_user_command("LspSymbolUsages", function(args)
	local bufnr = vim.api.nvim_get_current_buf()

	local client = vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/references" })[1]
	if not client then
		vim.notify("No LSP client attached", vim.log.levels.ERROR)
		return
	end

	local params = vim.lsp.util.make_position_params(0, "utf-8")
	params.context = { includeDeclaration = false }

	client:request("textDocument/references", params, function(err, result)
		if err then
			vim.notify("LSP reference error: " .. err.message, vim.log.levels.ERROR)
			return
		end
		if not result or vim.tbl_isempty(result) then
			vim.notify("No references found", vim.log.levels.INFO)
			return
		end

		local filtered = {}
		for _, ref in ipairs(result) do
			local uri = ref.uri
			local ref_bufnr = vim.uri_to_bufnr(uri)
			if not vim.api.nvim_buf_is_loaded(ref_bufnr) then
				vim.fn.bufload(ref_bufnr)
			end

			-- Ensure Tree-sitter parser is ready
			local lang = vim.treesitter.language.get_lang(vim.bo[ref_bufnr].filetype)
			local parser = vim.treesitter.get_parser(ref_bufnr, lang)
			if not parser then
				goto continue
			end

			local root = parser:parse()[1]:root()
			local row = ref.range.start.line
			local col = ref.range.start.character

			local node = root:named_descendant_for_range(row, col, row, col)
			local parent = node and node:parent()

			local skip = false
			while parent do
				local type = parent:type()
				if type == "import_statement" or type == "import_clause" then
					skip = true
					break
				end
				parent = parent:parent()
			end

			if not skip then
				table.insert(filtered, ref)
			end

			::continue::
		end

		if vim.tbl_isempty(filtered) then
			vim.notify("No non-import references found", vim.log.levels.INFO)
			return
		end
		vim.fn.setqflist(vim.lsp.util.locations_to_items(filtered, client.offset_encoding), "r")
		vim.cmd("copen")
	end, bufnr)
end, {})

vim.api.nvim_create_user_command("LspFileReferences", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr })
	for _, client in ipairs(clients) do
		if client.name == "ts_ls" or client.name =="vtsls" then
             local params = vim.lsp.util.make_text_document_params(bufnr)
             client:request("workspace/executeCommand", {
                 command = "typescript.findAllFileReferences",
                 arguments = { params.uri }
             }, function(err, result)
                 if err then
                     vim.notify("LSP command error: " .. err.message, vim.log.levels.ERROR)
                     return
                 end
                 if not result or vim.tbl_isempty(result) then
                     vim.notify("No references found", vim.log.levels.INFO)
                     return
                 end
                 local items = vim.lsp.util.locations_to_items(result, client.offset_encoding)
                 vim.fn.setqflist(items, "r")
                 vim.cmd("copen")
             end, bufnr)
			-- client:exec_cmd({command="typescript.findAllFileReferences",
			--  arguments = { params.uri}
			--              },{bufnr=0})
			return
		end
	end
end, {range=true})

vim.api.nvim_create_user_command("LspAddMissingImports", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr })
	for _, client in ipairs(clients) do
		if client.name == "ts_ls" or client.name == "vtsls" then
			vim.lsp.buf.code_action({
				context = { only = { "source.addMissingImports.ts" } },
				apply = true,
			})
			return
		end
	end
end, {})

vim.api.nvim_create_user_command("LspFixAll", function(args)
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr })
	for _, client in ipairs(clients) do
		if client.name == "ts_ls" or client.name=="vtsls" then
			vim.lsp.buf.code_action({
				context = { only = { "source.fixAll.ts" } },
				apply = true,
			})
			return
		end
	end
end, {})
