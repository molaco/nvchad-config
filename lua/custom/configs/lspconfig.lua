local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "tsserver", "clangd"}
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- 

lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true;
      },
      diagnostics = {
        enable = false;
      }
    }
  }
}

lspconfig.rnix.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"nix"},
  -- root_dir = util.root_pattern("flake.nix"),
}

lspconfig.clangd.setup{
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  filetypes = {"cpp"},
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"lua"},
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
