local jdtls = require "jdtls"
local jdtls_setup = require "jdtls.setup"
local root_dir = jdtls_setup.find_root { "build.gradle", "pom.xml", "build.xml" }

local INSTALL_ROOT_PATH = vim.fn.stdpath "data" .. "/mason"
local LSP_ROOT_PATH = INSTALL_ROOT_PATH .. "/packages"


local on_attach_java = function(client, bufnr)
  -- jdtls.setup_dap { hotcodereplace = "auto" }
  -- jdtls_dap.setup_dap_main_class_configs()
  jdtls_setup.add_commands()
end

local on_init = function(client)
  if client.config.settings then
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end
end
-- si no se encuentra la raíz del proyecto, se finaliza sin inicializar jdt.ls
if not root_dir then
  vim.notify("no root found", vim.log.levels.WARN, {
    title = "jdtls status",
    timeout = 200,
  })
  return
end

local eclipse_wd = os.getenv("HOME")
    .. "/java-workspace/"
    .. vim.fn.fnamemodify(root_dir, ":h:t")
    .. "/"
    .. vim.fn.fnamemodify(root_dir, ":t")
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local jdtls_root = LSP_ROOT_PATH .. "/jdtls/"

local jar = vim.fn.glob(jdtls_root .. "plugins/org.eclipse.equinox.launcher_*.jar", false, false)
local config_location = jdtls_root .. ("config_mac")
local lombok = LSP_ROOT_PATH .. "/jdtls/lombok.jar"
local config = {
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
      },
      project = {
        referencedLibraries = {
          "**/lib/*.jar",
        },
      },
    },
  },
  flags = {
    allow_incremental_sync = true,
  },
  capabilities = require("plugins.lsp.servers_configs").capabilities,
  on_attach = on_attach_java,
  on_init = on_init,
  -- stylua: ignore
  cmd = {
    "java",
    "-javaagent:" .. lombok,
    "-Xbootclasspath/a:" .. lombok,
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1G",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", jar,
    "-configuration", config_location,
    "-data", eclipse_wd,
  },
  root_dir = root_dir,
  init_options = {
    -- bundles = {
    --   vim.fn.glob(LSP_ROOT_PATH .. "java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    -- },
    extendedClientCapabilities = extendedClientCapabilities,
  },
}

-- vim.list_extend(
--   config.init_options.bundles,
--   -- vim.split(vim.fn.glob(LSP_ROOT_PATH .. "java-test/extension/server/*.jar"), "\n")
-- )

jdtls.start_or_attach(config)
