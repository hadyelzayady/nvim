return function(setup_lsp)
  setup_lsp('yamlls', {
    settings = {
      yaml = {
        schemas = require("schemastore").yaml.schemas({
          extra = {},
        }),
        validate = { enable = true },
      },
    },
  })
end
