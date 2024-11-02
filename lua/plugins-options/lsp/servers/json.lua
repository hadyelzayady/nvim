return function(setup_lsp)
  setup_lsp('jsonls', {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas({
          extra = {
            {
              description = "biome",
              fileMatch = { "biome.json" },
              name = "biome",
              url = "https://biomejs.dev/schemas/1.4.1/schema.json",
            },
          },
        }),
        validate = { enable = true },
      },
    },
  })
end
