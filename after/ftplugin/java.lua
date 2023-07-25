local _jdtls, jdtls = pcall(require, "jdtls")

if not _jdtls then
  return
end

local function on_init(client)
  if client.config.settings then
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end
end

local home = os.getenv("HOME")
local share_dir = home .. "/.local/share"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = share_dir .. "/eclipse/" .. project_name

-- Set proper Java executable
local mason_registry = require("mason-registry")

local bundles = {
  mason_registry.get_package("java-debug-adapter"):get_install_path() ..
  '/extension/server/com.microsoft.java.debug.plugin-0.45.0.jar'
}
vim.list_extend(bundles,
  vim.split(vim.fn.glob(mason_registry.get_package("java-test"):get_install_path() .. "/extension/server/*.jar"), "\n"))

local on_attach = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
  require("jdtls").setup_dap({ hotcodereplace = "auto" })
  -- require("").on_attach(client, bufnr)
  local status_ok, jdtls_dap = pcall(require, "jdtls.dap")
  if status_ok then
    jdtls_dap.setup_dap_main_class_configs({
      config_overrides = {
        vmArgs = "-Dspring.profiles.active=local",
      }
    })
  end
end

local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
local mason_path = share_dir .. "/MinimalNvim/mason"
local capabilities = require("plugins.lsp.servers_configs").capabilities
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local java_cmd = mason_path .. "/bin/jdtls"
print('works:' .. workspace_dir)
local config = {
  cmd = {
    java_cmd,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms512m',
    '-Xmx2048m',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    '-configuration', jdtls_path .. '/config_mac',
    '-data', workspace_dir
  },
  flags = {
    debounce_text_changes = 150,
    allow_incremental_sync = true
  },
  --root_dir = require("jdtls.setup").find_root({"build.gradle", "pom.xml", ".git"}),
  -- Using .metadata dir (Eclipse workspace) as reference for setting root dir
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },

  on_init = on_init,
  init_options = {
    bundles = bundles
  },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    java = {
      signatureHelp = {
        enabled = true
      },
      saveActions = {
        organizeImports = true
      },
      completion = {
        maxResults = 20,
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        }
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999
        }
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        }
      }
    }
  }
}

print('jdtlssss')
jdtls.start_or_attach(config)
