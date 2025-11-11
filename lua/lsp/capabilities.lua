local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
capabilities.general.positionEncodings = {"utf-16"}
capabilities = vim.tbl_deep_extend("force", capabilities, require("lsp-file-operations").default_capabilities())
return capabilities
