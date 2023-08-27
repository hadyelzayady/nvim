return {
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      }
    },
  },
  -- customize handlers for commands
  -- handlers = {
  --   source_definition = function(err, locations) end,
  --   file_references = function(err, locations) end,
  --   code_action = function(err, actions) end,
  -- },
  -- automatically trigger renaming of extracted symbol
  refactor_auto_rename = true,
}
