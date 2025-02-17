local M = {}
local settings = {
  servers = {},
  on_attach = nil,
  configs = {},
}

M.servers = function(servers)
  settings.servers = servers
end

M.on_attach = function(on_attach)
  settings.on_attach = on_attach
end

M.configure = function(server, config)
  -- local server_config = settings.configs[server] or {}
  -- settings.configs[server] = vim.tbl_deep_extend("force", server_config, config)
  settings.configs[server] = config
end

M.nvim_workspace = function()
  require("neodev").setup()
end

M.setup = function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = settings.servers
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = false
  -- capabilities.offsetEncoding = "utf-8"

  for _, server in pairs(settings.servers) do
    -- strip server name until @
    server = string.match(server, "([^@]+)")
    -- print(server)

    local server_config = settings.configs[server] or {}

    local capabilities = vim.deepcopy(capabilities)
    if server == "clangd" then
      capabilities.offsetEncoding = "utf-8"
    end

    server_config = vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = settings.on_attach,
      }, server_config)

    require("lspconfig")[server].setup(server_config)
  end
end

return M
