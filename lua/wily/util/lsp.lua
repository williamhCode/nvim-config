local M = {}
local settings = {
  servers = {},
  on_attach = nil,
  configs = {},
}

M.ensure_installed = function(servers)
  settings.servers = servers
end

M.on_attach = function(on_attach)
  settings.on_attach = on_attach
end

M.configure = function(server, config)
  local server_config = settings.configs[server] or {}
  settings.configs[server] = vim.tbl_deep_extend("force", server_config, config)
end

M.nvim_workspace = function()
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  M.configure("sumneko_lua", {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
        -- Doesn't work yet: https://github.com/LuaLS/lua-language-server/issues/1068
        -- format = {
        --   enable = true,
        --   defaultConfig = {
        --     indent_style = "space",
        --     indent_size = "2",
        --   }
        -- },
      }
    }
  })
end

M.setup = function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = settings.servers
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = false

  for _, server in pairs(settings.servers) do
    local server_config = settings.configs[server] or {}

    server_config = vim.tbl_deep_extend("force", {
      capabilities = capabilities,
      on_attach = settings.on_attach,
    }, server_config)

    require("lspconfig")[server].setup(server_config)
  end
end

return M

