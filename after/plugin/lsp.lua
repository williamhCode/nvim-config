local lsp = require("wily.util.lsp")

lsp.ensure_installed({
  "sumneko_lua",
  "pyright",
  "clangd",
  "jdtls",
  "omnisharp_mono",
  "bashls",
  "texlab",
})

lsp.on_attach(function(client, bufnr)
  if client.server_capabilities.signatureHelpProvider then
    require('lsp-overloads').setup(client, {
      ui = {
        close_events = { "CursorMoved", "CursorMovedI", "InsertCharPre" },
        floating_window_above_cur_line = true,
      },
    })
  end

  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = group,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = group,
    })
  end

  local map = vim.keymap.set
  local opts = { buffer = bufnr }
  map('n', "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  map('n', "gD", vim.lsp.buf.declaration, opts)
  map('n', "gh", vim.lsp.buf.hover, opts)
  map('n', "gs", vim.lsp.buf.signature_help, opts)
  map('i', "<M-x>", vim.lsp.buf.signature_help, opts)
  map('n', "gr", "<cmd>Telescope lsp_implementations<CR>", opts)
  map('n', "<leader>lf", vim.diagnostic.open_float, opts)
  if client.name ~= "texlab" then
    map('n', "<leader>lca", vim.lsp.buf.code_action, opts)
    map('n', "<leader>lrn", vim.lsp.buf.rename, opts)
  end
  map('n', "[d", vim.diagnostic.goto_prev, opts)
  map('n', "]d", vim.diagnostic.goto_next, opts)
  map({ 'n', 'v' }, "<M-F>", function() vim.lsp.buf.format({ async = true }) end, opts)
end)

-- server setups
lsp.nvim_workspace()

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          -- indent_style = "space",
          -- indent_size = "2",
          continuation_indent = "2",
        }
      },
    }
  }
})

lsp.configure("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        autoImportCompletions = false,

        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

lsp.setup()
