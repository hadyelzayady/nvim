return function(setup_lsp)
  require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended
  setup_lsp('vtsls', {
    on_attach = function()

    end,
    -- automatically trigger renaming of extracted symbol
    settings = {
      -- Add `vtsls` specific settings here if needed
    },
  })
end
