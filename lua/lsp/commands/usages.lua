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
